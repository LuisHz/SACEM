/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;


import Beans.Usuario;
import Beans.Usuario_rol;
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
@WebServlet(name = "CRUDUsuario", urlPatterns = {"/CRUDUsuario"})
public class CRUDUsuario extends HttpServlet {

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
	
	String op = request.getParameter("op");
	if (op.equals("listar")) {
	    try {
		PreparedStatement select_usuarios = ConexionDB.getConexion().prepareStatement("select dni,usuario,nomb_rol from usuario");
		ResultSet rs_usuario = select_usuarios.executeQuery();
		ArrayList<Usuario> lista_usuario = new ArrayList<Usuario>();

		while (rs_usuario.next()) {
		    Usuario usu = new Usuario(rs_usuario.getString(1), rs_usuario.getString(2),"",rs_usuario.getString(3));
		    lista_usuario.add(usu);
		}

		request.setAttribute("lista_usuario", lista_usuario);
		
		PreparedStatement select_roles = ConexionDB.getConexion().prepareStatement("select * from usuario_rol");
		ResultSet rs_usuario_rol = select_roles.executeQuery();
		ArrayList<Usuario_rol> lista_rol = new ArrayList<Usuario_rol>();

		while (rs_usuario_rol.next()) {
		    Usuario_rol usu_rol = new Usuario_rol(rs_usuario_rol.getString(1));
		    lista_rol.add(usu_rol);
		}

		request.setAttribute("lista_rol", lista_rol);
		
		

		request.getRequestDispatcher("usuarios.jsp").forward(request, response);
	    } catch (Exception e) {
		System.out.println("Error " + e);
	    }

	}

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
