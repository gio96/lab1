<%-- 
    Document   : funcionara
    Created on : 4/05/2017, 11:27:13 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="vehServlet?action=funcio">
Ingrese nombre de usuario:
<input type="text" name="placa" size="20"><br>

<input type="submit" value="confirmar">
</form>
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
    </body>
</html>
