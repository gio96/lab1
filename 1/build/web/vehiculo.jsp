<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <link rel="stylesheet"
              href="https://bootswatch.com/darkly/bootstrap.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <title>Informacion vehiculos</title>
  </head>
  <body>
    <div class="container">
      <h1 align="center">Informacion vehiculo</h1>
      <form class="well" action="./vehServlet?action=buscar" method="post" enctype="multipart/form-data">
        <!--enctype="multipart/form-data" permite la subida de archivos -->
        <div style="margin-left:70px">
          <!-- <tr> para crear cada fila y <td> para crear cada columna.-->
          <tr>
            <th>Matricula</th>
            <th><br><input type="text" name="matricula" placeholder="Matricula" required="true" class="form-control" ></th>
          </tr>
          <tr>
            <th>Marca</th>
            <th><br><input type="text" name="marca" placeholder="Marca" class="form-control" ></th>
          </tr>
          <tr>
            <th>Modelo</th>
            <th><br><input type="text" name="modelo" placeholder="modelo" class="form-control" ></th>
          </tr>
          <tr>
            <th>Color</th>
            <th><br><input type="text" name="color" placeholder="color" class="form-control" ></th>
          </tr>
          <tr>
            <th>Precio en millones:  </th>
            <th><br><input type="text" name="precio" class="form-control" ></th>
          </tr>
          <tr>
            <th>Foto</th>
            <th><br><input type="file" name="foto" size="50"</th>
          </tr>
          <tr>
            <td colspan="2"><br>
              <input class="btn btn-primary" type="submit" name="action" value="Agregar">
              <i class="glyphicon glyphicon-plus text-success"></i>
                <input class="btn btn-warning" type="submit" name="action" value="Editar">
                <i class="glyphicon  glyphicon-pencil text-info"></i>
                <input class="btn btn-danger" type="submit" name="action" value="Borrar">
                  <i class="glyphicon glyphicon-trash text-danger"></i>
                <input class="btn btn-primary" type="submit" name="action" value="Buscar"/>
                <i class="glyphicon btn-glyphicon glyphicon-search text-primary" ></i>
                <input class="btn btn-primary" type="submit" name="action" value="BuscarTodos"/>
                <i class="glyphicon btn-glyphicon glyphicon-search text-primary"></i>
              </td>
          </tr>
        </div>
        <hr>
        <br>
          <table class="table table-inverse">
            <thead>
              <tr>
                <th>Matricula</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Color</th>
                <th>Precio</th>
                <th>Foto</th>
              </tr>
            </thead>
            
            <c:forEach var="v" items="${getAll}">
                <tr>
                    <td>${v.matricula}</td>
                    <td>${v.marca}</td>
                    <td>${v.modelo}</td>
                    <td>${v.precio}</td>
                    <td>${v.color}</td>
                </tr>
            </c:forEach>
                
                
                
          </table>
          
                
                    
                    <hr>
                    <h3 align="center">Busqueda Vehiculo</h3>
                    
             <table class="table table-inverse">
                <thead>
                  <tr>
                    <th>Matricula</th>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Color</th>
                    <th>Precio</th>
                    <th>Foto</th>
                  </tr>
                </thead>
                    <tr>
                        <td>${getOne.matricula}</td>
                        <td>${getOne.marca}</td>
                        <td>${getOne.modelo}</td>
                        <td>${getOne.precio}</td>
                        <td>${getOne.color}</td>
                    </tr>
            </table>

      </form>
    </div>
  </body>
</html>
