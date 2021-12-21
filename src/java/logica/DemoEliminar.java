/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

/**
 *
 * @author fido
 */
public class DemoEliminar {
    public static void main(String[] args) {
        Categoria c = new Categoria();
        c.setId(5);
        if (c.eliminarCategoria()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No Ejecutada");
        }
    }
}
