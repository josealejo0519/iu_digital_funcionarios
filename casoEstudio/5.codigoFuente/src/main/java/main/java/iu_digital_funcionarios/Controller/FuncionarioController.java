package main.java.iu_digital_funcionarios.Controller;

import java.sql.SQLException;
import java.util.List;
import main.java.iu_digital_funcionarios.Dao.FuncionarioDao;
import main.java.iu_digital_funcionarios.Domain.Funcionario;

public class FuncionarioController {
    //Lógica de negocio / lógica de la aplicación
    
    private FuncionarioDao funcionarioDao;
    public FuncionarioController() {
        funcionarioDao = new FuncionarioDao();
    }

    public List<Funcionario> getFuncionarios() throws SQLException {
        return funcionarioDao.getFuncionarios();
    }
    
     public void create(Funcionario funcionario) throws SQLException {
        funcionarioDao.create(funcionario);
    }
    
    public Funcionario getFuncionario(int id) throws SQLException {
        return funcionarioDao.getFuncionario(id);
    }
    
    public void updateFuncionario(int id, Funcionario funcionario) throws SQLException {
        funcionarioDao.updateFuncionario(id, funcionario);
    }
    
    public void deleteFuncionario(int id) throws SQLException {
        funcionarioDao.deleteFuncionario(id);
    }
}
