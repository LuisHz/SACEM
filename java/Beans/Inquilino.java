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
public class Inquilino {
    private String dni;
    private String nombre;
    private String nro_departamento;

    public Inquilino(String dni, String nombre, String nro_departamento) {
	this.dni = dni;
	this.nombre = nombre;
	this.nro_departamento = nro_departamento;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNro_departamento() {
        return nro_departamento;
    }

    public void setNro_departamento(String nro_departamento) {
        this.nro_departamento = nro_departamento;
    }
}
