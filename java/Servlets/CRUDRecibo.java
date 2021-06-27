/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Año;
import Beans.Mes;
import Beans.Recibo;
import Beans.Servicio;
import Utils.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis
 */
@WebServlet(name = "CRUDRecibo", urlPatterns = {"/CRUDRecibo"})
public class CRUDRecibo extends HttpServlet {

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
		PreparedStatement select_meses = ConexionDB.getConexion().prepareStatement("select * from mes ORDER BY orden");
		ResultSet rs_mes = select_meses.executeQuery();
		ArrayList<Mes> lista_mes = new ArrayList<Mes>();

		while (rs_mes.next()) {
		    Mes mes = new Mes(rs_mes.getString(1));
		    lista_mes.add(mes);
		}

		request.setAttribute("lista_mes", lista_mes);

		PreparedStatement select_años = ConexionDB.getConexion().prepareStatement("select * from año");
		ResultSet rs_año = select_años.executeQuery();
		ArrayList<Año> lista_año = new ArrayList<Año>();

		while (rs_año.next()) {
		    Año año = new Año(rs_año.getInt(1));
		    lista_año.add(año);
		}

		request.setAttribute("lista_año", lista_año);

		PreparedStatement select_servicios = ConexionDB.getConexion().prepareStatement("select * from servicio");
		ResultSet rs_servicio = select_servicios.executeQuery();
		ArrayList<Servicio> lista_servicio = new ArrayList<Servicio>();

		while (rs_servicio.next()) {
		    Servicio servicio = new Servicio(rs_servicio.getString(1));
		    lista_servicio.add(servicio);
		}

		request.setAttribute("lista_servicio", lista_servicio);

		PreparedStatement select_recibos = ConexionDB.getConexion().prepareStatement("select año,nomb_mes,nomb_serv,monto,DATE_FORMAT(fecha_registro,'%d-%m-%Y') as fecha_registro from recibo");
		ResultSet rs_recibo = select_recibos.executeQuery();
		ArrayList<Recibo> lista_recibo = new ArrayList<Recibo>();

		while (rs_recibo.next()) {
		    Recibo recibo = new Recibo(rs_recibo.getInt(1), rs_recibo.getString(2), rs_recibo.getString(3), rs_recibo.getDouble(4), rs_recibo.getString(5));
		    lista_recibo.add(recibo);
		}

		request.setAttribute("lista_recibo", lista_recibo);

		request.getRequestDispatcher("recibos.jsp").forward(request, response);
	    } catch (Exception e) {
		System.out.println("Error " + e);
	    }

	} else if (op.equals("insertar")) {

	    /*int año = Integer.parseInt(request.getParameter("select-año"));*/
	    String nomb_mes = request.getParameter("select-mes");
	    String nomb_servicio = request.getParameter("select-servicio");
	    double monto = Double.parseDouble(request.getParameter("txtMonto"));
	    
	    Calendar fecha = Calendar.getInstance();
	    int mes_cal =  fecha.get(Calendar.MONTH) + 1;
	    String new_mes = "";
	    if (mes_cal < 10) {
		new_mes = "0" + mes_cal;
	    }
	    int año_cal = fecha.get(Calendar.YEAR);
	    int dia_cal = fecha.get(Calendar.DAY_OF_MONTH);
	    String fecha_registro = año_cal + "-" +  new_mes + "-" + dia_cal;

	   

	    try {
		PreparedStatement insert_recibo = ConexionDB.getConexion().prepareStatement("INSERT INTO recibo (año,nomb_mes,nomb_serv,monto,fecha_registro) VALUES(?,?,?,?,?)");
		insert_recibo.setInt(1, 2021);
		insert_recibo.setString(2, nomb_mes);
		insert_recibo.setString(3, nomb_servicio);
		insert_recibo.setDouble(4, monto);
		insert_recibo.setString(5, fecha_registro);
		
		insert_recibo.executeUpdate();

		request.getRequestDispatcher("CRUDRecibo?op=listar").forward(request, response);

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
