<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Resumen del producto</title>
  <style>
    body { font-family: Arial, sans-serif; padding: 20px; max-width: 700px; margin: auto; }
    .item { margin-top: 10px; }
    .label { font-weight: 700; }
    .oferta { color: red; font-weight: 700; }
  </style>
</head>
<body>
  <h1>Resumen del producto</h1>

  <!-- Validar que se haya enviado al menos el nombre -->
  <c:if test="${not empty param.nombre}">
    
    <!-- Nombre del producto -->
    <div class="item">
      <span class="label">Nombre:</span> <c:out value="${param.nombre}" />
      <br/>
      <span class="label">Cantidad de caracteres:</span> <c:out value="${fn:length(param.nombre)}" />
    </div>

    <!-- Categoría con c:choose -->
    <div class="item">
      <span class="label">Categoría:</span>
      <c:out value="${param.categoria}" />
      <br/>
      <c:choose>
        <c:when test="${param.categoria == 'maquillaje'}">
          Este producto es parte de nuestra línea de maquillaje.
        </c:when>
        <c:when test="${param.categoria == 'skincare'}">
          Perfecto para el cuidado de la piel.
        </c:when>
        <c:when test="${param.categoria == 'accesorios'}">
          Accesorio imprescindible para complementar tu look.
        </c:when>
        <c:otherwise>
          Categoría no reconocida.
        </c:otherwise>
      </c:choose>
    </div>

    <!-- Precio -->
    <div class="item">
      <span class="label">Precio:</span> 
      <c:choose>
        <c:when test="${param.precio != null and param.precio ge 0}">
          $<c:out value="${param.precio}" /> CLP
        </c:when>
        <c:otherwise>
          Precio inválido
        </c:otherwise>
      </c:choose>
    </div>

    <!-- Oferta -->
    <c:if test="${not empty param.oferta}">
      <div class="item oferta">¡Este producto está en oferta!</div>
    </c:if>

    <div style="margin-top:20px;">
      <a href="index.jsp">Agregar otro producto</a>
    </div>

  </c:if>

  <c:if test="${empty param.nombre}">
    <p>No se enviaron datos. <a href="index.jsp">Volver al formulario</a></p>
  </c:if>
</body>
</html>

