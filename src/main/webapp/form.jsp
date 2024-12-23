<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
 Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de productos</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h2>Formulario de productos</h2>

<div class="px-5">
<form action="<%= request.getContextPath() %>/crear" method="post">

  <div class="row mb-3">
    <label for="nombre" class="col-form-label col-sm-2">Nombre</label>
    <div class="col-sm-4">
        <input type="text" name="nombre" id="nombre" class="form-control" value="${param.nombre}">
    </div>
      <%
      if(errores != null && errores.containsKey("nombre")){
           out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("nombre") + "</small>");
      }
      %>
    </div>

  <div class="row mb-3">
    <label for="precio" class="col-form-label col-sm-2">Precio</label>
    <div class="col-sm-4">
        <input type="text" name="precio" id="precio" class="form-control" value="${param.precio}">
  </div>
      <%
      if(errores != null && errores.containsKey("precio")){
         out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("precio") + "</small>");
      }
      %>
  </div>

  <div class="row mb-3">
    <label for="fabricante" class="col-form-label col-sm-2">Fabricante</label>
    <div class="col-sm-4">
        <input type="text" name="fabricante" id="fabricante" minlength="4" maxlength="10" class="form-control" value="${param.fabricante}">
  </div>
      <%
      if(errores != null && errores.containsKey("fabricante")){
             out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("fabricante") + "</small>");
      }
      %>
  </div>

  <div class="row mb-3">
    <label for="categoria" class="col-form-label col-sm-2">Categoría</label>
    <div class="col-sm-4">
      <select name="categoria" id="categoria" class="form-select">
        <option value="">-- seleccionar --</option>
        <option value="ET" ${param.categoria.equals("ES")? "selected": ""}>Electrodomésticos</option>
        <option value="MV" ${param.categoria.equals("MX")? "selected": ""}>Móviles</option>
        <option value="CC" ${param.categoria.equals("CL")? "selected": ""}>Cocina</option>
        <option value="SL" ${param.categoria.equals("AR")? "selected": ""}>Sala</option>
        <option value="CM" ${param.categoria.equals("PE")? "selected": ""}>Comedor</option>
        <option value="CL" ${param.categoria.equals("CO")? "selected": ""}>Colchones</option>
        <option value="PC" ${param.categoria.equals("VE")? "selected": ""}>Computadores</option>
      </select>
    </div>
       <%
       if(errores != null && errores.containsKey("categoria")){
              out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("categoria") + "</small>");
       }
       %>
  </div>

  <div class="row mb-5">
    <div>
      <input type="submit" value="Enviar" class="btn btn-primary btn-lg mt-5">
    </div>
  </div>

</form>
</div>
</body>
</html>