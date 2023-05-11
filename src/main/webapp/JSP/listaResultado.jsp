<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="es.albarregas.beans.Ave"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados</title>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}" media="screen" />
    </head>
    <body>
        <div id="contenido">
            <h2>Listado de todas las aves de la base de datos</h2>
            <table>
                <tr>
                    <th>Anilla</th>
                    <th>Especie</th>
                    <th>Lugar</th>
                    <th>Fecha</th>
                </tr>
                <c:forEach var="ave" items="${requestScope.lista}">
                    <tr>
                        <td><c:out value="${ave.anilla}"/></td>
                        <td><c:out value="${ave.especie}"/></td>
                        <td><c:out value="${ave.lugar}"/></td>
                        <td><c:out value="${ave.fecha}"/></td>
                    </tr>
                </c:forEach>
                
            </table>



            <br />
            <p><a href="${applicationScope.contexto}/Volver">Volver</a></p>
        </div>
    </body>
</html>