/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Departamento;
import Utils.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis
 */
@WebServlet(name = "CRUDDepartamento", urlPatterns = {"/CRUDDepartamento"})
public class CRUDDepartamento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);

	String op = request.getParameter("op");
	if (op.equals("listar")) {
	    try {
		PreparedStatement select_departamentos = ConexionDB.getConexion().prepareStatement("select * from departamento");
		ResultSet rs_departamento = select_departamentos.executeQuery();
		ArrayList<Departamento> lista_departamento = new ArrayList<Departamento>();

		while (rs_departamento.next()) {
		    Departamento departamento = new Departamento(rs_departamento.getString(1), rs_departamento.getInt(2), rs_departamento.getBoolean(3));
		    lista_departamento.add(departamento);
		}

		request.setAttribute("lista_departamento", lista_departamento);

		request.getRequestDispatcher("departamentos.jsp").forward(request, response);
	    } catch (Exception e) {
		System.out.println("Error " + e);
	    }

	} else if (op.equals("insertar")) {

	    String nro_dpto = request.getParameter("txtNrodpto");
	    int piso = Integer.parseInt(request.getParameter("txtPiso"));
	    boolean ocupado = false;
	    try {
		PreparedStatement insert_dpto = ConexionDB.getConexion().
			prepareStatement("INSERT INTO departamento (nro_departamento,piso,ocupado) VALUES(?,?,?)");
		insert_dpto.setString(1, nro_dpto);
		insert_dpto.setInt(2, piso);
		insert_dpto.setBoolean(3, ocupado);
		insert_dpto.executeUpdate();
		request.getRequestDispatcher("CRUDDepartamento?op=listar").forward(request, response);

	    } catch (Exception e) {
		System.out.println("Error al insertar: " + e);
	    }

	}

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}
