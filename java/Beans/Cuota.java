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
public class Cuota {
    private int año;
    private String mes;
    private double monto_total_mes;
    private int cantidad_pagadores;
    private double cuota_del_mes;
    private String fecha_registro;

    public Cuota() {
        Calendar fecha = Calendar.getInstance();
 
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH) + 1;
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        fecha_registro = año + "-" + mes+ "-" + dia;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public double getMonto_total_mes() {
        return monto_total_mes;
    }

    public void setMonto_total_mes(double monto_total_mes) {
        this.monto_total_mes = monto_total_mes;
    }

    public int getCantidad_pagadores() {
        return cantidad_pagadores;
    }

    public void setCantidad_pagadores(int cantidad_pagadores) {
        this.cantidad_pagadores = cantidad_pagadores;
    }

    public double getCuota_del_mes() {
        return cuota_del_mes;
    }

    public void setCuota_del_mes(double cuota_del_mes) {
        this.cuota_del_mes = cuota_del_mes;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }
}
