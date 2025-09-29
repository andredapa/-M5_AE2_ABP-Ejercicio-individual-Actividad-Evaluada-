<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Formulario producto</title>
  <style>
    /* estilo mínimo para que se vea ordenado */
    body { font-family: Arial, sans-serif; padding: 20px; max-width: 600px; margin: auto; }
    label { display: block; margin-top: 12px; font-weight: 600; }
    input[type="text"], input[type="number"], select { width: 100%; padding: 8px; box-sizing: border-box; margin-top: 6px; }
    .row { display:flex; align-items:center; gap:8px; margin-top:8px; }
    .actions { margin-top: 16px; }
  </style>
</head>
<body>
  <h1>Agregar producto</h1>

  <!-- action="" envía a la misma página; usa action="resumen.jsp" para enviar a resumen.jsp -->
  <form method="post" action="resumen.jsp" autocomplete="off">
    <label for="nombre">Nombre del producto</label>
    <input id="nombre" name="nombre" type="text" required maxlength="100" placeholder="Ej: Labial color cereza" />

    <label for="categoria">Categoría</label>
    <select id="categoria" name="categoria" required>
      <option value="">-- Selecciona --</option>
      <option value="maquillaje">Maquillaje</option>
      <option value="skincare">Skincare</option>
      <option value="accesorios">Accesorios</option>
    </select>

    <label for="precio">Precio (CLP)</label>
    <input id="precio" name="precio" type="number" required min="0" step="0.01" placeholder="Ej: 12990" />

    <div class="row">
      <input id="oferta" name="oferta" type="checkbox" value="si" />
      <label for="oferta" style="display:inline-block; margin:0;">¿Está en oferta?</label>
    </div>

    <div class="actions">
      <button type="submit">Enviar</button>
    </div>
  </form>
</body>
</html>
