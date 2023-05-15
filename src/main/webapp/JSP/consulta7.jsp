<%-- 
    Document   : consulta1
    Created on : 14-may-2023, 17:18:41
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="style" value="CSS/styleResultados.css" scope="application" />

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta 7</title>
        <link rel="stylesheet" type="text/css" href="${style}"/>

    </head>
    <body>
        <h1>Consulta 7</h1>
        <br>
        <h4>Nombre, apellidos y edad en años de los alumnos varones cuya edad sea inferior a la media aritmética en años, que hayan nacido en un año par y en domingo.</h4>
        <br>
        <table border="1">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Edad</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="alumnoDatos" items="${alumnos}">
                    <tr>
                        <td>${alumnoDatos.nombre}</td>
                        <td>${alumnoDatos.apellidos}</td>
                        <td>${alumnoDatos.edad}</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <a href="Volver"><b>Volver</b></a>
    </body>
</html>
