<%-- 
    Document   : recibos
    Created on : 21 jun. 2021, 18:31:36
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
		<h2>Recibos</h2>
		<form action="CRUDRecibo" class="row g-4">
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
		    <div class="col-md-3">
			<label for="select-servicio" class="form-label">Servicio</label>
			<select class="form-select" name="select-servicio" id="select-servicio" required>
			    <option selected disabled value="">Seleccione</option>
			    <%
				ArrayList<Servicio> lista_servicio = (ArrayList<Servicio>) request.getAttribute("lista_servicio");
				for (int i = 0; i < lista_servicio.size(); i++) {
				    Servicio e = lista_servicio.get(i);
                            %>
			    <option>
				<%=e.getNomb_serv()%>
			    </option>
                            <%
				}
			    %>
			</select>
		    </div>
		    <div class="col-md-3">
			<label for="txtMonto" class="form-label">Monto</label>
			<div class="input-group">
			    <span class="input-group-text">S/</span>
			    <input type="number" class="form-control" name="txtMonto" id="txtMonto"  step="0.01" min="0" placeholder="ejm. 120.50"required>
			</div>
		    </div>
			<input type="hidden" name="op" value="insertar">
		    <div class="col-md-3">
			<input type="submit" name="btnSubmit" value="Registrar recibo" class="btn btn-primary">
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

			<%
			    ArrayList<Recibo> lista_recibo = (ArrayList<Recibo>) request.getAttribute("lista_recibo");
			    for (int i = 0; i < lista_recibo.size(); i++) {
				Recibo e = lista_recibo.get(i);
			%>
			<tr>
			    <td><%=e.getAño()%></td>
			    <td><%=e.getMes()%></td>
			    <td><%=e.getServicio()%></td>
			    <td><%=e.getMonto()%></td>
			    <td><%=e.getFecha_registro()%></td>
			</tr>
			<%
			    }
			%>
		    </table>
		</div>

	    </div>
	</main>
    </body>
</html>