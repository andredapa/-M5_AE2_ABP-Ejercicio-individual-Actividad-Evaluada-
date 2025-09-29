<%--<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*, java.util.Map" %>

<%
    // Creamos una lista de productos simulada
    List<Map<String,Object>> productos = new ArrayList<>();

    Map<String,Object> p1 = new HashMap<>();
    p1.put("nombre","Labial Cereza");
    p1.put("categoria","maquillaje");
    p1.put("precio",12990);
    p1.put("oferta",true);
    productos.add(p1);

    Map<String,Object> p2 = new HashMap<>();
    p2.put("nombre","Crema Hidratante");
    p2.put("categoria","skincare");
    p2.put("precio",15990);
    p2.put("oferta",false);
    productos.add(p2);

    Map<String,Object> p3 = new HashMap<>();
    p3.put("nombre","Brocha de maquillaje");
    p3.put("categoria","accesorios");
    p3.put("precio",7990);
    p3.put("oferta",true);
    productos.add(p3);

    request.setAttribute("productos", productos);
%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; max-width: 800px; margin:auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .oferta { color: red; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Lista de Productos</h1>

    <table>
        <tr>
            <th>Nombre</th>
            <th>Categoría</th>
            <th>Precio</th>
            <th>Oferta</th>
            <th>Longitud del nombre</th>
        </tr>

        <!-- Iteramos con c:forEach -->
        <c:forEach var="producto" items="${productos}">
            <tr>
                <td><c:out value="${producto.nombre}" /></td>
                
                <td>
                    <c:choose>
                        <c:when test="${producto.categoria == 'maquillaje'}">
                            Maquillaje
                        </c:when>
                        <c:when test="${producto.categoria == 'skincare'}">
                            Skincare
                        </c:when>
                        <c:when test="${producto.categoria == 'accesorios'}">
                            Accesorios
                        </c:when>
                        <c:otherwise>
                            Otra
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <c:if test="${producto.precio ge 0}">
                        $<c:out value="${producto.precio}" />
                    </c:if>
                    <c:if test="${producto.precio lt 0}">
                        Precio inválido
                    </c:if>
                </td>

                <td>
                    <c:if test="${producto.oferta}">
                        <span class="oferta">Sí</span>
                    </c:if>
                    <c:if test="${not producto.oferta}">
                        No
                    </c:if>
                </td>

                <td><c:out value="${fn:length(producto.nombre)}" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
