<%-- 
    Document   : pagadores
    Created on : 21 jun. 2021, 18:31:57
    Author     : Luis
--%>

<%@page import="Beans.Inquilino"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Departamento"%>
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
		<h2>Inquilinos</h2>
		<form class="row g-3">
		    <div class="col-md-4">
			<label for="txtDni" class="form-label">Numero de DNI</label>
			<input type="number" maxlength="8" class="form-control" name="txtDni" id="txtDni" placeholder="ejm. 47898233" required>
		    </div>

		    <div class="col-md-4">
			<label for="txtNombres" class="form-label">Nombres y Apellidos</label>
			<input type="text" class="form-control" name="txtNombres" id="txtNombres"placeholder="ejm. Felipe Guzman" required>
		    </div>

		    <div class="col-md-4">
			<label for="select-departamento" class="form-label">Departamento</label>
			<select class="form-select" name="select-departamento" id="select-departamento" required>
			    <option selected disabled value="">Seleccione</option>
			    <%
				ArrayList<Departamento> lista_departamento = (ArrayList<Departamento>) request.getAttribute("lista_departamento");
				for (int i = 0; i < lista_departamento.size(); i++) {
				    Departamento e = lista_departamento.get(i);
                            %>
			    <option>
				<%=e.getNro_departamento()%>
			    </option>
                            <%
				}
			    %>
			</select>
		    </div>

		    <div class="col-md-3">
			<input type="submit" name="btnSubmit" value="Registrar inquilino" class="btn btn-primary">
		    </div>

		    <div class="container mt-5">
			<table class="table table-hover">
			    <tr>
				<th>
				    DNI
				</th>
				<th>
				    Nombres y Apellidos
				</th>
				<th>
				    Departamento
				</th>
			    </tr>

			    <%
				ArrayList<Inquilino> lista_inquilino = (ArrayList<Inquilino>) request.getAttribute("lista_inquilino");
				for (int i = 0; i < lista_inquilino.size(); i++) {
				    Inquilino e = lista_inquilino.get(i);
			    %>
			    <tr>
				<td><%=e.getDni()%></td>
				<td><%=e.getNombre()%></td>
				<td><%=e.getNro_departamento()%></td>
			    </tr>
			    <%
				}
			    %>
			</table>
		    </div>

		</form>
	    </div>
	</main>
    </body>
</html>
