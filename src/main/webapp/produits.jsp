<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ page 
    
    import="java.util.ArrayList,java.util.List,com.nextu.entities.Produit"
 %>
 <%
  List<Produit> produits = new ArrayList<Produit>();
  if(request.getAttribute("produits")!=null){
	  produits = (ArrayList<Produit>)request.getAttribute("produits");
  }
%>
<div class="container-fluid">
    <div class="row">
      <%@ include file="/WEB-INF/template/menu.jsp" %>
      <main class="col-md-10 ml-sm-auto col-lg-10 pt-3 px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
          <h1 class="h2"><i class="fa fa-tachometer"></i> Categories</h1>
          <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group mr-2">
		   		<a href="form-produit.jsp" class="btn btn-sm btn-primary">Add new</a>        
            </div>
          </div>
        </div>
		<%@ include file="/WEB-INF/error/error-message.jsp" %>
		<div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 pr-0 mb-3">
            <div class="card-collapsible card">
              <div class="card-header">
                Categories <i class="fa fa-caret-down caret"></i>
              </div>
              <div class="card-body">
                <table class="table">
                  <thead class="thead bg-primary text-white">
                    <tr>
                    	<th scope="col">Code</th>
                      <th scope="col">Name</th>
                      <th scope="col">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                 	<%
                     for(Produit sp :produits){
                  %>
                    <tr>
                    	<td><%= sp.getCode()%></td>
                      <td><%= sp.getLibelle()%></td>
                      <td>
                          <a class="btn btn-sm btn-success" href="modifierProduit?codeProduit=<%= sp.getCode()%>"> 
                          	<i class="fa fa-edit"></i>
                          	Edit
                          </a>
                            <!-- Button trigger modal -->
                          <a href="deleteProduit?codeProduit=<%= sp.getCode()%>" class="btn btn-sm btn-danger">
                          	<i class="fa fa-trash"></i>
                            Delete
                          </a>
                    </tr>
                  <%
                    }
                  %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
</div>
<!-- Modal
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Voulez-vous supprimer cette ressource
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
        <a href="deleteProduit?codeProduit=" class="btn btn-primary">Confirmer</a>
      </div>
    </div>
  </div> -->
</div>
</body>
</html>