<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ page import="com.nextu.entities.Produit" %>
<div class="container-fluid">
    <div class="row">
      <%@ include file="/WEB-INF/template/menu.jsp" %>
      <main class="col-md-10 ml-sm-auto col-lg-10 pt-3 px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
          <h1 class="h2"><i class="fa fa-tachometer"></i> Dashboard</h1>
        </div>
		<%@ include file="/WEB-INF/error/error-message.jsp" %>
        <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 pr-0 mb-3">
            <div class="card-collapsible card">
              <div class="card-header">
                Edit a category<i class="fa fa-caret-down caret"></i>
              </div>
              <div class="card-body">
                <form method="post" action="modifierProduit">
                
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="Intitul� du produit" name="libelle" value="${produit.libelle}">
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                      </button>
                      <input type="hidden" name="codeProduit" value="${produit.code}">
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>
</body>
</html>