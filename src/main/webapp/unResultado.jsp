<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados</title>
        <link rel="stylesheet" type="text/css" href="estilo.css" media="screen" />
    </head>
    <body>
        <div id="contenido">
            <h2>Salida de resultados para la anilla <%=request.getAttribute("anilla")%></h2>
            <p>La especie es: <%=request.getAttribute("especie")%></p>
            <p>se encuentra en: <%=request.getAttribute("lugar")%></p>
            <p>en la fecha: <%=request.getAttribute("fecha")%></p>



            <br />
            <p><a href="<%= request.getContextPath()%>">Volver</a></p>
        </div>
    </body>
</html>