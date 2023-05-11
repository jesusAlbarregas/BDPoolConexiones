<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notificaci&oacute;n</title>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}" />
    </head>
    <body>
        <div id="error">
            
            <p><c:out value="${requestScope.aviso}"/></p>



            <br />
            <p><a href="${applicationScope.contexto}/Volver">Volver</a></p>
        </div>
    </body>
</html>