<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados</title>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}" media="screen" />
    </head>
    <body>
        <div id="contenido">
            <h2>Salida de resultados para la anilla ${requestScope.ave.anilla}</h2>
            <p>La especie es: ${requestScope.ave.especie}</p>
            <p>se encuentra en: ${requestScope.ave.lugar}</p>
            <p>en la fecha: ${requestScope.ave.fecha}</p>



            <br />
            <p><a href="${applicationScope.contexto}/Volver">Volver</a></p>
        </div>
    </body>
</html>