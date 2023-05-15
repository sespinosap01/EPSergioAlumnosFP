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
        <title>Consulta 4</title>
        <link rel="stylesheet" type="text/css" href="${style}"/>

    </head>
    <body>
        <h1>Consulta 4</h1>
        <br>
        <h4>Número de alumnos matriculados en cada ciclo</h4>
        <br>
        <table border="1">
            <thead>
                <tr>
                    <th>Ciclo</th>
                    <th>Total de alumnos</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cicloDatos" items="${ciclo}">
                    <tr>
                        <td>${cicloDatos.nombre}</td>
                        <td>${cicloDatos.sumaAlumnos}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <a href="Volver"><b>Volver</b></a>
    </body>
</html>
