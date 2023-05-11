<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contexto" value="${pageContext.request.contextPath}" scope="application" />
<c:url var="estilo" value="/CSS/estilo.css" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avistamientos</title>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}" />
    </head>
    <body>
        <div id="contenido">
            <h2>Página de avistamientos</h2>
            <form action="${contexto}/Buscador" method="post">
                <table>
                    <tr>
                        <td>Introduce una anilla</td>
                        <td><input name="anilla" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Anilla" name="unaAnilla"/></td>
                        <td><input type="submit" value="Todas" name="todas"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
