/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.util.Calendar;

/**
 *
 * @author Luis
 */
public class Recibo {

    private int año;
    private String mes;
    private String servicio;
    private double monto;
    private String fecha_registro;

    public Recibo(int año, String mes, String servicio, double monto, String fecha_registro) {
	this.año = año;
	this.mes = mes;
	this.servicio = servicio;
	this.monto = monto;
	this.fecha_registro = fecha_registro;
    }



    public String getServicio() {
	return servicio;
    }

    public void setServicio(String servicio) {
	this.servicio = servicio;
    }

    public int getAño() {
	return año;
    }

    public void setAño(int año) {
	this.año = año;
    }

    public String getMes() {
	return mes;
    }

    public void setMes(String mes) {
	this.mes = mes;
    }

    public double getMonto() {
	return monto;
    }

    public void setMonto(double monto) {
	this.monto = monto;
    }

    public String getFecha_registro() {
	return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
	this.fecha_registro = fecha_registro;
    }

}
