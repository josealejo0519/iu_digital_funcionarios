
package main.java.iu_digital_funcionarios.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import main.java.iu_digital_funcionarios.Domain.Funcionario;
import main.java.iu_digital_funcionarios.Util.ConnectionUtil;

public class FuncionarioDao {
    private static final String GET_FUNCIONARIOS = " SELECT * FROM funcionarios ";
    
    private static final String CREATE_FUNCIONARIO = "INSERT INTO funcionarios(numero_documento, "
            + "nombres , apellidos, estado_civil, sexo, direccion, telefono, fecha_nacimiento)" 
            + " VALUES('?', '?', '?', '?', '?', '?', '?', '?') ";
    
    private static final String GET_FUNCIONARIO_BY_ID = "SELECT * FROM funcionarios WHERE id = ? ";
    
    private static final String UPDATE_FUNCIONARIO = "UPDATE funcionarios SET numero_documento = ?,"
            + "nombres = ?, apellidos =?, estado_civil=?, sexo=?, direccion=?, telefono=?, fecha_nacimiento=?";
    
    private static final String DELETE_FUNCIONARIO = "DELETE FROM funcionarios WHERE id = ? ";
    
    public List<Funcionario> getFuncionarios()throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Funcionario> cars = new ArrayList<> ();
        
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_FUNCIONARIOS );
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Funcionario funcionario = new Funcionario();
                funcionario.setFuncionario_id(resultSet.getInt("Funcionario_id"));
                funcionario.setNumero_documento(resultSet.getString("numero_documento"));
                funcionario.setNombres(resultSet.getString("nombres"));
                funcionario.setApellidos(resultSet.getString("apellidos"));
                funcionario.setEstado_civil(resultSet.getString("estado_civil"));
                funcionario.setSexo(resultSet.getString("sexo"));
                funcionario.setDireccion(resultSet.getString("direccion"));
                funcionario.setTelefono(resultSet.getString("telefono"));
                funcionario.setFecha_nacimiento(resultSet.getString("fecha_nacimiento"));
                cars.add(funcionario);
            }
            return cars;       
  
        }finally {
            if (connection != null) {
                connection.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        }
    }
    
    public void create(Funcionario funcionario) throws SQLException {

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareCall(CREATE_FUNCIONARIO);
            preparedStatement.setString(1, funcionario.getNombres());
            preparedStatement.setString(2, funcionario.getApellidos());
            preparedStatement.setString(3, funcionario.getEstado_civil());
            preparedStatement.setString(4, funcionario.getSexo());
            preparedStatement.setString(5, funcionario.getDireccion());
            preparedStatement.setString(6, funcionario.getTelefono());
            preparedStatement.setString(7, funcionario.getFecha_nacimiento());
            preparedStatement.executeUpdate();

        } finally {
            if (connection != null) {
                connection.close();
            }

            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }
    
    public Funcionario getFuncionario(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Funcionario funcionario = null;

        try {

            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_FUNCIONARIO_BY_ID);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                funcionario = new Funcionario();
                funcionario.setFuncionario_id(resultSet.getInt("Funcionario_id"));
                funcionario.setNumero_documento(resultSet.getString("numero_documento"));
                funcionario.setNombres(resultSet.getString("nombres"));
                funcionario.setApellidos(resultSet.getString("apellidos"));
                funcionario.setEstado_civil(resultSet.getString("estado_civil"));
                funcionario.setSexo(resultSet.getString("sexo"));
                funcionario.setDireccion(resultSet.getString("direccion"));
                funcionario.setTelefono(resultSet.getString("telefono"));
                funcionario.setFecha_nacimiento(resultSet.getString("fecha_nacimiento"));

            }
            return funcionario;

        } finally {

            if (connection != null) {
                connection.close();
            }

            if (preparedStatement != null) {
                preparedStatement.close();
            }

            if (resultSet != null) {
                resultSet.close();
            }
        }
    }
    
    public void updateFuncionario(int id, Funcionario funcionario) throws SQLException {

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(UPDATE_FUNCIONARIO);
            preparedStatement.setString(1, funcionario.getNombres());
            preparedStatement.setString(2, funcionario.getApellidos());
            preparedStatement.setString(3, funcionario.getEstado_civil());
            preparedStatement.setString(4, funcionario.getSexo());
            preparedStatement.setString(5, funcionario.getDireccion());
            preparedStatement.setString(6, funcionario.getTelefono());
            preparedStatement.setString(7, funcionario.getFecha_nacimiento());
            preparedStatement.setInt(8, funcionario.getFuncionario_id());
            preparedStatement.executeUpdate();

        } finally {
            if (connection != null) {
                connection.close();
            }

            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }
    
    public void deleteFuncionario(int funcionario_id) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        try {
            
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(DELETE_FUNCIONARIO);
            preparedStatement.setInt(1, funcionario_id);
            preparedStatement.executeUpdate();
            
        } finally {
            if (connection != null) {
                connection.close();
            }

            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }
}
