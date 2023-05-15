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
        <title>Consulta 8</title>
        <link rel="stylesheet" type="text/css" href="${style}"/>

    </head>
    <body>
        <h1>Consulta 8</h1>
        <br>
        <h4>Visualizaremos la edad en años del alumno más viejo, la edad en años del alumno más joven, la media aritmética de las edades en años redondeada a cero decimales y la suma de las edades en años de los alumnos. </h4>
        <br>
        <table border="1">
            <thead>
                <tr>
                    <th>Edad más joven</th>
                    <th>Edad más vieja</th>
                    <th>Media de edad</th>
                    <th>Suma de edades</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="estadisticasDatos" items="${estadisticas}">
                    <tr>
                        <td>${estadisticasDatos.EdadMasJoven}</td>
                        <td>${estadisticasDatos.EdadMasViejo}</td>
                        <td>${estadisticasDatos.MediaEdades}</td>
                        <td>${estadisticasDatos.SumaEdades}</td>                       
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <a href="Volver"><b>Volver</b></a>
    </body>
</html>
