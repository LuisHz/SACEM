/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

public class ConexionDB {
    
    public static  Connection getConexion(){
        Connection con = null;
        String cadena = "jdbc:mysql://localhost/sacem?user=root&password=";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(cadena);
            System.out.println("Conexion Satisfactoria");
        } catch (Exception e) {
            System.out.println("Error " + e );
        }
        
        return con;
    }
    
    public static void main(String[] args) {
        getConexion();
    }
}
