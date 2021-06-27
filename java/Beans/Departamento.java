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
public class Departamento {
    private String nro_departamento;
    private int piso;
    private boolean ocupado;

    public Departamento(String nro_departamento, int piso, boolean ocupado) {
	this.nro_departamento = nro_departamento;
	this.piso = piso;
	this.ocupado = ocupado;
    }
    
    
    public String getNro_departamento() {
        return nro_departamento;
    }

    public void setNro_departamento(String nro_departamento) {
        this.nro_departamento = nro_departamento;
    }

    public int getPiso() {
        return piso;
    }

    public void setPiso(int piso) {
        this.piso = piso;
    }

    public boolean isOcupado() {
        return ocupado;
    }

    public void setOcupado(boolean ocupado) {
        this.ocupado = ocupado;
    }
}
