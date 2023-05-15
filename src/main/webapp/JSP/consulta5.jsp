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
        <title>Consulta 5</title>
        <link rel="stylesheet" type="text/css" href="${style}"/>

    </head>
    <body>
        <h1>Consulta 5</h1>
        <br>
        <h4>Nombre, apellidos y fecha de nacimiento de las alumnas matriculadas en DAW</h4>
        <br>
        <table border="1">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Fecha de Nacimiento</th>
                    <th>Genero</th>
                    <th>Ciclo</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="alumnoDatos" items="${alumnos}">
                    <tr>
                        <td>${alumnoDatos.nombre}</td>
                        <td>${alumnoDatos.apellidos}</td>
                        <td>${alumnoDatos.FechaNacimiento}</td>
                        <td>${alumnoDatos.Genero}</td>
                        <td>${alumnoDatos.Ciclo}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <a href="Volver"><b>Volver</b></a>
    </body>
</html>
