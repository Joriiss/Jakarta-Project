<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ page 
    
    import="java.util.ArrayList,java.util.List,com.nextu.entities.Categorie"
 %>
 <%
  List<Categorie> categories = new ArrayList<Categorie>();
  if(request.getAttribute("categories")!=null){
     categories = (ArrayList<Categorie>)request.getAttribute("categories");
  }
%>
<div class="container-fluid">
    <div class="row">
      <%@ include file="/WEB-INF/template/menu.jsp" %>
      <main class="col-md-10 ml-sm-auto col-lg-10 pt-3 px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
          <h1 class="h2"><i class="fa fa-tachometer"></i> My products</h1>
          <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group mr-2">
		   		<a href="form-categorie.jsp" class="btn btn-sm btn-primary">Add new</a>        
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 pr-0 mb-3">
            <div class="card-collapsible card">
              <div class="card-header">
                Table <i class="fa fa-caret-down caret"></i>
              </div>
              <div class="card-body">
                <table class="table">
                  <thead class="thead bg-primary text-white">
                    <tr>
                      <th scope="col">Code</th>
                      <th scope="col">Name</th>
                      <th scope="col">Category</th>
                      <th scope="col">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                 	<%
                     for(Categorie dsp :categories){
                  %>
                    <tr>
                      <td><%= dsp.getCode()%></td>
                      <td><%= dsp.getLibelle()%></td>
                      <td><%= dsp.getProduit().getLibelle()%></td>
                      <td>
                          <a class="btn btn-sm btn-success" href="modifierCategorie?codeCategorie=<%= dsp.getCode()%>">
                          	<i class="fa fa-edit"></i>
                          	Edit
                          </a>
                            <!-- Button trigger modal -->
                          <a href="deleteProduit?codeProduit=<%= dsp.getCode()%>" class="btn btn-sm btn-danger">
                          	<i class="fa fa-trash"></i>
                            Delete
                          </a>
                      </td>
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
</body>
</html>