/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistente;

import Conexao.ConexaoDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import Dominio.Carro;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author leona
 */
public class CarroBD {

    static Connection con;
    static PreparedStatement pstm;
    static ResultSet rs;
    public static void inserir(Carro car) throws ClassNotFoundException, SQLException{
        String sql = "INSERT INTO carros values(default,?,?,?,?,?,?)";
        con = new ConexaoDAO().ConexaoBD();
        
        try {
            pstm= con.prepareStatement(sql);
            pstm.setString(1, car.getNome());
            pstm.setString(2, car.getModelo());
            pstm.setString(3, car.getMarca());
            pstm.setString(4, car.getCor());
            pstm.setInt(5, car.getAnoFab());
            pstm.setDouble(6, car.getPreco());
        } catch (SQLException e) {
            System.out.println(e);
        }
        pstm.execute();
        pstm.close();
    }
    
    public static ArrayList<Carro> conteudoBD(String modelo) throws ClassNotFoundException{
        String sql2;
        if(modelo.equals("undefied")){
         sql2 = "SELECT * from carros";
        } else {
         sql2 = "Select * from carros where modelo like '%"+modelo+"%'";
        }
        con = new ConexaoDAO().ConexaoBD();
        
            ArrayList<Carro> carlist = new ArrayList<Carro>();
        try {
            pstm= con.prepareStatement(sql2);
            rs = pstm.executeQuery(sql2);
            
            while(rs.next()){
                Carro obj = new Carro(rs.getInt("idCar"),rs.getString("marca"),rs.getString("modelo"),rs.getString("cor"),rs.getString("nome"),rs.getInt("nomeFab"), rs.getDouble("preco"));
                carlist.add(obj);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return carlist;
    }

    
    public static void excluir(String id) throws ClassNotFoundException, SQLException{
          String sql = "DELETE FROM carros where idCar = ?";
          con = new ConexaoDAO().ConexaoBD();
          
          try{
          pstm = con.prepareStatement(sql);
          pstm.setString(1, id);
          pstm.execute();
          pstm.close();
          } catch(Exception e){
              System.out.println(e);
          }
          
          
    }
    public static void alterar(String id,String nome, String modelo, String marca, String cor, int anoFab, double preco) throws ClassNotFoundException,SQLException{
        String sql = "UPDATE carros set nome = ?, marca = ?, modelo = ?, cor = ?, nomeFab = ? , preco = ? where idCar = ?";
        con = new ConexaoDAO().ConexaoBD();
        pstm = con.prepareStatement(sql);
        pstm.setString(1, nome);
        pstm.setString(2, marca);
        pstm.setString(3, modelo);
        pstm.setString(4, cor);
        pstm.setInt(5, anoFab);
        pstm.setDouble(6, preco);
        pstm.setInt(7, Integer.parseInt(id));
        pstm.execute();
        pstm.close();
    }
}
