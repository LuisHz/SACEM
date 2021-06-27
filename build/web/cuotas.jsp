<%-- 
    Document   : cuotas
    Created on : 21 jun. 2021, 18:31:08
    Author     : Luis
--%>

<%@page import="Beans.Recibo"%>
<%@page import="Beans.Servicio"%>
<%@page import="Beans.Mes"%>
<%@page import="Beans.Año"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SACEM - Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">SACEM</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CRUDCuota?op=listar">Cuotas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CRUDRecibo?op=listar">Recibos</a>
                            </li>
			    <li class="nav-item">
                                <a class="nav-link" href="CRUDUsuario?op=listar">Usuarios</a>
                            </li>
			    <li class="nav-item">
                                <a class="nav-link" href="CRUDInquilino?op=listar">Inquilinos</a>
                            </li>
			    <li class="nav-item">
                                <a class="nav-link" href="CRUDDepartamento?op=listar">Departamentos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
	<main>
	    <div class="container">
		<h2>Cuotas</h2>
		<form action="CRUDCuota" class="row g-4">
		    <div class="col-md-3">
			<label for="select-año" class="form-label">Año</label>
			<select class="form-select" name="select-año" id="select-año" required>
			    <option selected disabled value="">Seleccione</option>
			    <%
				ArrayList<Año> lista_año = (ArrayList<Año>) request.getAttribute("lista_año");
				for (int i = 0; i < lista_año.size(); i++) {
				    Año e = lista_año.get(i);
			    %>
			    <option>
				<%=e.getAño()%>
			    </option>
			    <%
				}
			    %>
			</select>
		    </div>
		    <div class="col-md-3">
			<label for="select-mes" class="form-label">Mes</label>
			<select class="form-select" name="select-mes" id="select-mes" required>
			    <option selected disabled value="">Seleccione</option>
			    <%
				ArrayList<Mes> lista_mes = (ArrayList<Mes>) request.getAttribute("lista_mes");
				for (int i = 0; i < lista_mes.size(); i++) {
				    Mes e = lista_mes.get(i);
			    %>
			    <option>
				<%=e.getNomb_mes()%>
			    </option>
			    <%
				}
			    %>
			</select>
		    </div>
		    <input type="hidden" name="op" value="listar_recibos">
		    <div class="col-md-3 d-flex flex-column justify-content-end">
			<input type="submit" name="btnSubmit" value="Consultar recibos" class="btn btn-primary">
		    </div>

		</form>
		<div class="container mt-5">
		    <table class="table table-hover">
			<tr>
			    <th>
				Año
			    </th>
			    <th>
				Mes
			    </th>
			    <th>
				Servicio
			    </th>
			    <th>
				Monto
			    </th>
			    <th>
				Fecha de registro
			    </th>
			</tr>
			
		    </table>
		</div>

		<div class="row mt-5">
		    <div class="col-md-3">
			<label for="txtMontoTotalMes" class="form-label">Monto total del mes</label>
			<div class="input-group">
			    <span class="input-group-text">S/</span>
			    <input type="number" class="form-control" name="txtMontoTotalMes" id="txtMontoTotalMes" required>
			</div>
		    </div>

		    <div class="col-md-3">
			<label for="txtCantidadInquilinos" class="form-label">Cantidad de inquilinos</label>
			<input type="number" class="form-control" name="txtCantInquilino" id="txtCantInquilino" required>

		    </div>

		</div>
		<div class="row">
		    <div class="col-md-3">
			<label for="txtCuotaCalculada" class="form-label">Cuota calculada</label>
			<input type="number" class="form-control" name="txtCuotaCalculada" id="txtCuotaCalculada" required>
		    </div>
		    <div class="col-md-3 d-flex flex-column justify-content-end">
			<input type="submit" name="btnSubmit" value="Calcular cuota" class="btn btn-primary">
		    </div>

		</div>
		<div class="row mt-5">
		    <div class="col-md-3 d-flex flex-column justify-content-end">
			<input type="submit" name="btnSubmit" value="Registrar cuota" class="btn btn-primary">
		    </div>
		</div>
	    </div>

	</main>
    </body>
</html>