package es.albarregas.persistencia;

import es.albarregas.beans.Ave;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import javax.annotation.Resource;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@WebServlet(name = "Acceso", urlPatterns = {"/buscador"})
public class AccesoBD extends HttpServlet {

//    @Resource(name = "java:comp/env/jdbc/Pool")
    DataSource datasource;

    @Override
    public void init(ServletConfig config)
            throws ServletException {
        try {
            Context contextoInicial = new InitialContext();
            datasource = (DataSource) contextoInicial.lookup("java:comp/env/jdbc/Pool");
        } catch (NamingException ex) {
            System.out.println("Problemas en el acceso a la BD");
            ex.printStackTrace();
        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conexion = null;
        Statement sentencia = null;
        PreparedStatement preparada = null;
        ResultSet resultado = null;
        Ave ave = null;
        List<Ave> listado = null;

        String anilla = request.getParameter("anilla");
        String sql = null;
        String url = null;
        try {
            conexion = datasource.getConnection();
            if (request.getParameter("unaAnilla") != null) {

                sql = "select * from aves where anilla = ?";
                preparada = conexion.prepareStatement(sql);
                preparada.setString(1, anilla);
                try {
                    resultado = preparada.executeQuery();

                    resultado.next();
                    url = "unResultado.jsp";
                    request.setAttribute("anilla", resultado.getString("anilla"));
                    request.setAttribute("especie", resultado.getString("especie"));
                    request.setAttribute("lugar", resultado.getString("lugar"));
                    request.setAttribute("fecha", resultado.getString("fecha"));
                } catch (SQLException e) {

                    url = "error.jsp";
                    request.setAttribute("error", "La anilla " + anilla
                            + " no existe en la base de datos");
                }
            } else {
                sql = "select * from aves";
                sentencia = conexion.createStatement();
                resultado = sentencia.executeQuery(sql);
                listado = new ArrayList();
                url = "listaResultado.jsp";

                while (resultado.next()) {

                    ave = new Ave();
                    ave.setAnilla(resultado.getString("anilla"));
                    ave.setEspecie(resultado.getString("especie"));
                    ave.setLugar(resultado.getString("lugar"));
                    ave.setFecha(resultado.getString("fecha"));
                    listado.add(ave);
                }
                request.setAttribute("lista", listado);
            }

            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException ex) {
            System.out.println("Error al crear la conexión");
            ex.printStackTrace();
        } finally {
            try {
                if (resultado != null) {
                    resultado.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if (preparada != null) {
                    preparada.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

}
