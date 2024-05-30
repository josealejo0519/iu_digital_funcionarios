
package main.java.iu_digital_funcionarios;

import java.sql.SQLException;
import java.util.List;
import main.java.iu_digital_funcionarios.Controller.FuncionarioController;
import main.java.iu_digital_funcionarios.Domain.Funcionario;



public class Iu_digital_funcionarios {

    public static void main(String[] args) {
        FuncionarioController funcionarioController = new FuncionarioController();
        getFuncionarios(funcionarioController);
    }
    
    public static void getFuncionarios(FuncionarioController funcionarioController) {
        try {
            List<Funcionario> funcionarios = funcionarioController.getFuncionarios();
            if (funcionarios.isEmpty()) {
                System.out.println("There aren't funcionarios");
            } else {
                funcionarios.forEach(funcionario -> {
                    System.out.println("Id: " + funcionario.getFuncionario_id());
                    System.out.println("Numero_documento: " + funcionario.getNumero_documento());
                    System.out.println("Nombres: " + funcionario.getNombres());
                    System.out.println("Apellidos: " + funcionario.getApellidos());
                    System.out.println("Estado_civil: " + funcionario.getEstado_civil());
                    System.out.println("Sexo: " + funcionario.getSexo());
                    System.out.println("Direccion: " + funcionario.getDireccion());
                    System.out.println("Telefono: " + funcionario.getTelefono());
                    System.out.println("Fecha_nacimiento: " + funcionario.getFecha_nacimiento());
                    System.out.println("****************************************");
                });
            }            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
