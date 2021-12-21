/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.List;

/**
 *
 * @author fido
 */
public class DemoConsultar {

    public static void main(String[] args) {
        Categoria c = new Categoria();
        List<Categoria> lista = c.consultarCategorias();
        for (Categoria cat : lista) {
            System.out.println(cat);
        }
    }
}
