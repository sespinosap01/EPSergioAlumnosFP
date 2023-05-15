<%-- 
    Document   : index
    Created on : 14-may-2023, 16:37:10
    Author     : Sergio
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contexto" value="${pageContext.request.contextPath}" scope="application"/>
<c:url var="style" value="CSS/style.css" scope="application" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" type="text/css" href="${style}"/>
    </head>
    <body>
        <h1>Alumnos y ciclos de FP del IES Albarregas</h1>
        <br>
        <ol>
            <li><a href="FrontController?op=1"><b>VER</b></a> Los diez primeros alumnos clasificados alfabéticamente. </li>
            <li><a href="FrontController?op=2"><b>VER</b></a> Alumnas que tengan menos de 20 años de edad.</li>
            <li><a href="FrontController?op=3"><b>VER</b></a> Alumnos con un apellido que estén cursando un ciclo de grado superior.</li>
            <li><a href="FrontController?op=4"><b>VER</b></a> Número de alumnos matriculados en cada ciclo.</li>
            <li><a href="FrontController?op=5"><b>VER</b></a> Nombre, apellidos y fecha de nacimiento de las alumnas matriculadas en DAW.</li>
            <li><a href="FrontController?op=6"><b>VER</b></a> Datos de ls ciclo cuya abreviatura tenga 4 caracteres y 400 horas de FCT. </li>
            <li><a href="FrontController?op=7"><b>VER</b></a> Nombre, apellidos y edad en años de los alumnos varones cuya edad sea inferior a la media aritmética en años, que hayan nacido en un año par y en domingo.</li>
            <li><a href="FrontController?op=8"><b>VER</b></a> Estadísticas sobre los alumnos matriculados.</li>        
        </ol>
    </body>
</html>

