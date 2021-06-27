/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author Luis
 */
public class Mes {
    private String nomb_mes;
    private int orden;

    public Mes(String nomb_mes) {
	this.nomb_mes = nomb_mes;
    }

    public String getNomb_mes() {
	return nomb_mes;
    }

    public void setNomb_mes(String nomb_mes) {
	this.nomb_mes = nomb_mes;
    }

    public int getOrden() {
	return orden;
    }

    public void setOrden(int orden) {
	this.orden = orden;
    }
    
}
