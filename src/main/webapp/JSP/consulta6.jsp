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
        <title>Consulta 6</title>
        <link rel="stylesheet" type="text/css" href="${style}"/>

    </head>
    <body>
        <h1>Consulta 6</h1>
        <br>
        <h4>Datos de los ciclos cuya abreviatura tenga 4 caracteres y 400 horas de FCT.</h4>
        <br>
        <table border="1">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Abreviatura</th>
                    <th>Horas de FCT</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cicloDatos" items="${ciclo}">
                    <tr>
                        <td>${cicloDatos.nombre}</td>
                        <td>${cicloDatos.Abreviatura}</td>
                        <td>${cicloDatos.HorasFCT}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <a href="Volver"><b>Volver</b></a>
    </body>
</html>
