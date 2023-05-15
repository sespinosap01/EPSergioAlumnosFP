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
            <li><a href="FrontController?op=1"><b>VER</b></a> Los diez primeros alumnos clasificados alfab�ticamente. </li>
            <li><a href="FrontController?op=2"><b>VER</b></a> Alumnas que tengan menos de 20 a�os de edad.</li>
            <li><a href="FrontController?op=3"><b>VER</b></a> Alumnos con un apellido que est�n cursando un ciclo de grado superior.</li>
            <li><a href="FrontController?op=4"><b>VER</b></a> N�mero de alumnos matriculados en cada ciclo.</li>
            <li><a href="FrontController?op=5"><b>VER</b></a> Nombre, apellidos y fecha de nacimiento de las alumnas matriculadas en DAW.</li>
            <li><a href="FrontController?op=6"><b>VER</b></a> Datos de ls ciclo cuya abreviatura tenga 4 caracteres y 400 horas de FCT. </li>
            <li><a href="FrontController?op=7"><b>VER</b></a> Nombre, apellidos y edad en a�os de los alumnos varones cuya edad sea inferior a la media aritm�tica en a�os, que hayan nacido en un a�o par y en domingo.</li>
            <li><a href="FrontController?op=8"><b>VER</b></a> Estad�sticas sobre los alumnos matriculados.</li>        
        </ol>
    </body>
</html>

