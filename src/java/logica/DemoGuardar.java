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
public class DemoGuardar {

    public static void main(String[] args) {
        Categoria c = new Categoria();
        c.setNombre("Terror");
        c.setDescripcion("Libros de categoria de terror");
        if (c.guardarCategoria()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No Ejecutada");
        }
    }
}
