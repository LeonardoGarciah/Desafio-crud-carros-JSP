/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Teste;

import Dominio.Carro;
import Persistente.CarroBD;
import java.util.ArrayList;

/**
 *
 * @author leona
 */
public class Teste {
    public static void main(String[] args) throws ClassNotFoundException{
    ArrayList<Carro> list =  CarroBD.conteudoBD("undefied");
        for (Carro carro : list) {
            System.out.println(carro.getNome());
        }
    }
}
