/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {

    DataSource datasource;

    @Override
    public void init(ServletConfig config)
            throws ServletException {
        try {
            Context contextoInicial = new InitialContext();
            datasource = (DataSource) contextoInicial.lookup("java:comp/env/jdbc/EPSergioAlumnosFP");
        } catch (NamingException ex) {
            System.out.println("Problemas en el acceso a la BD");
            ex.printStackTrace();
        }

    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");
        String url = "";
        List<Map<String, Object>> listaAlumnos = new ArrayList<>();
        List<Map<String, Object>> listaCiclos = new ArrayList<>();
        List<Map<String, Object>> listaEstadisticas = new ArrayList<>();

        String sql = "";
        Connection conexion = null;
        PreparedStatement preparada = null;
        ResultSet resultado = null;

        switch (op) {
            case "1":
                sql = "SELECT * FROM datosalumnos where nombre != \"null\" ORDER BY apellidos LIMIT 10;";
                url = "JSP/consulta1.jsp";
                break;

            case "2":
                sql = "SELECT * FROM datosalumnos WHERE DATEDIFF(CURDATE(), FechaNacimiento) / 365 < 20 AND genero = \"MUJER\";";
                url = "JSP/consulta2.jsp";
                break;

            case "3":
                sql = "SELECT * FROM datosalumnos WHERE apellidos IS NOT NULL AND apellidos != \"null\" AND SUBSTRING_INDEX(SUBSTRING_INDEX(Ciclo, '-', 1), '-', -1) LIKE '%3%';";
                url = "JSP/consulta3.jsp";
                break;

            case "4":
                sql = "select c.nombre, count(idUsuario) as sumaAlumnos from datosalumnos a inner join ciclos c on a.ciclo = c.idCiclo where a.nombre IS NOT NULL AND a.fechaNacimiento IS NOT NULL AND a.genero IS NOT NULL group by c.nombre;";
                url = "JSP/consulta4.jsp";
                break;

            case "5":
                sql = "SELECT * FROM datosalumnos WHERE Genero = \"MUJER\" AND ciclo LIKE \"IFC%\";";
                url = "JSP/consulta5.jsp";
                break;

            case "6":
                sql = "SELECT * FROM ciclos WHERE LENGTH(Abreviatura) = 4 AND HorasFCT = 400;";
                url = "JSP/consulta6.jsp";
                break;

            case "7":
                sql = "SELECT nombre, apellidos, FLOOR(DATEDIFF(CURDATE(), FechaNacimiento) / 365) AS edad FROM datosalumnos WHERE genero = \"HOMBRE\" AND FechaNacimiento % 2 = 0 AND DAYOFWEEK(FechaNacimiento) = 1 HAVING edad < (SELECT AVG(FLOOR(DATEDIFF(CURDATE(), FechaNacimiento) / 365)) FROM datosalumnos);";
                url = "JSP/consulta7.jsp";
                break;

            case "8":
                sql = "SELECT DATEDIFF(CURDATE(), MIN(FechaNacimiento)) / 365 AS EdadMasJoven, DATEDIFF(CURDATE(), MAX(FechaNacimiento)) / 365 AS EdadMasViejo, ROUND(AVG(DATEDIFF(CURDATE(), FechaNacimiento) / 365), 0) AS MediaEdades, SUM(DATEDIFF(CURDATE(), FechaNacimiento) / 365) AS SumaEdades FROM datosAlumnos;";
                url = "JSP/consulta8.jsp";
                break;
        }
        try {
            conexion = datasource.getConnection();
            preparada = conexion.prepareStatement(sql);
            resultado = preparada.executeQuery();

            //ARREGLAR 4, 7 Y 8
            while (resultado.next()) {
                Map<String, Object> alumno = new HashMap<>();

                if (op.equals("1") || op.equals("2") || op.equals("3") || op.equals("5")) {
                    alumno.put("nombre", resultado.getString("nombre"));
                    alumno.put("apellidos", resultado.getString("apellidos"));
                    alumno.put("Ciclo", resultado.getString("Ciclo"));
                    alumno.put("Genero", resultado.getString("Genero"));
                    alumno.put("FechaNacimiento", resultado.getString("FechaNacimiento"));
                    alumno.put("IdUsuario", resultado.getString("IdUsuario"));

                    listaAlumnos.add(alumno);
                }

                if (op.equals("4")) {
                    Map<String, Object> ciclo = new HashMap<>();
                    ciclo.put("nombre", resultado.getString("nombre"));
                    ciclo.put("sumaAlumnos", resultado.getInt("sumaAlumnos"));
                    listaCiclos.add(ciclo);
                }

                if (op.equals("7")) {
                    alumno.put("nombre", resultado.getString("nombre"));
                    alumno.put("apellidos", resultado.getString("apellidos"));
                    alumno.put("edad", resultado.getInt("edad"));
                    listaAlumnos.add(alumno);
                }

                if (op.equals("8")) {
                    Map<String, Object> datosEstadisticos = new HashMap<>();
                    datosEstadisticos.put("EdadMasJoven", resultado.getDouble("EdadMasJoven"));
                    datosEstadisticos.put("EdadMasViejo", resultado.getDouble("EdadMasViejo"));
                    datosEstadisticos.put("MediaEdades", resultado.getDouble("MediaEdades"));
                    datosEstadisticos.put("SumaEdades", resultado.getDouble("SumaEdades"));
                    listaEstadisticas.add(datosEstadisticos);

                }
                if (op.equals("6")) {
                    Map<String, Object> ciclo = new HashMap<>();
                    ciclo.put("nombre", resultado.getString("nombre"));
                    ciclo.put("IdCiclo", resultado.getString("IdCiclo"));
                    ciclo.put("Abreviatura", resultado.getString("Abreviatura"));
                    ciclo.put("HorasFCT", resultado.getShort("HorasFCT"));
                    ciclo.put("Ley", resultado.getString("Ley"));

                    listaCiclos.add(ciclo);
                }
            }

            request.setAttribute("estadisticas", listaEstadisticas);
            request.setAttribute("alumnos", listaAlumnos);
            request.setAttribute("ciclo", listaCiclos);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR DE SQL");
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
                if (resultado != null) {
                    resultado.close();
                }
                if (preparada != null) {
                    preparada.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
                System.out.println("ERROR DE SQL EN FINALLY");
            }
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
