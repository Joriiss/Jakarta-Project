package com.nextu.controllers.categorie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.nextu.entities.Categorie;
import com.nextu.entities.Produit;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.UserTransaction;

/**
 * Servlet implementation class CreerCategorie
 */
@WebServlet("/creerCategorie")
public class CreerCategorie extends HttpServlet {
   private static final long serialVersionUID = 1L;
   @PersistenceContext(unitName = "tp-final")
   private EntityManager em;
   @Resource
   private UserTransaction userTransaction;

   /**
    * Default constructor.
    */
   public CreerCategorie() {
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      TypedQuery<Produit> query = em.createQuery("SELECT s FROM Produit s", Produit.class);
      List<Produit> produits = query.getResultList();
      request.setAttribute("produits", produits);
      this.getServletContext().getRequestDispatcher("/form-categorie.jsp").forward(request,
            response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      String message = "Please choose a category";
      String libelle = request.getParameter("libelle");
      if (libelle == null || libelle.isEmpty() || libelle.isBlank()) {
         message = "Please enter a name";
         request.setAttribute("errorMessage", message);
         redirectWithErrorMessage(response, request);
      } else {
         Produit produit = this.findProduit(request.getParameter("produit"));
         if (produit == null) {
            message = "No categories selected";
            request.setAttribute("errorMessage", message);
            redirectWithErrorMessage(response, request);
         } else {
            saveCategorie(response, request, libelle, produit);
         }

      }

   }

   private void saveCategorie(HttpServletResponse response, HttpServletRequest request,
         String libelle, Produit produit) throws IOException {
      String message;
      boolean transactionOk = false;
      try {
         userTransaction.begin();
         Categorie categorie = new Categorie();
         categorie.setLibelle(libelle);
         categorie.setProduit(em.merge(produit));
         em.persist(categorie);
         transactionOk = true;
      } catch (Exception e) {
         System.out.print("An error occured");
      } finally {
         try {
            if (transactionOk) {
               userTransaction.commit();
               response.sendRedirect("categories");
            } else {
               message =
                     "An error occured";
               userTransaction.rollback();
               request.setAttribute("errorMessage", message);
               redirectWithErrorMessage(response, request);
            }
         } catch (Exception e) {
            message =
                  "An error occured";
            request.setAttribute("errorMessage", message);
            redirectWithErrorMessage(response, request);
         }
      }
   }

   private Produit findProduit(String codeProduit) throws IOException {
      Produit produit = null;
      try {
         produit = em.find(Produit.class, Long.valueOf(codeProduit));
      } catch (EntityNotFoundException e) {
         System.out.print("Aucune entit?? trouv??");
      } catch (Exception ex) {
         System.out.print(
               "An error occured");
      }
      return produit;
   }

   private void redirectWithErrorMessage(HttpServletResponse response, HttpServletRequest request)
         throws IOException {
      try {
         this.getServletContext().getRequestDispatcher("/form-categorie.jsp").forward(request,
               response);
      } catch (ServletException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

}