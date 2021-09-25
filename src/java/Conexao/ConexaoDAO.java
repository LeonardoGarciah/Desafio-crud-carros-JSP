/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author leona
 */
public class ConexaoDAO {
public Connection ConexaoBD() throws ClassNotFoundException{
        Connection con = null;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/cars?user=root&password=";
        con = (Connection) DriverManager.getConnection(url);
        } catch(SQLException e){
            System.out.println(e);
        }
        return con;
        
    }
}
