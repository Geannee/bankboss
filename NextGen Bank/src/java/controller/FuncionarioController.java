package controller;

import java.util.List;
import model.persistencia.Funcionario;
import model.persistencia.dao.FuncionarioDAO;
import model.persistencia.dao.Conexao;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class FuncionarioController {
        
        public Funcionario cadastra(Funcionario funcionario){
            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
            return funcionarioDAO.cadastrar(funcionario);
            
        }
           public List<Funcionario> buscarTodos() throws SQLException {
            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
            List<Funcionario> todos = new ArrayList<>();
            todos = funcionarioDAO.buscarTodos();
            return todos;
	}

	public List<Funcionario> buscarPorNome(String nome) {
            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
            List<Funcionario> todos = new ArrayList<>();
            todos = funcionarioDAO.buscarPorNome(nome);
            return todos;
	}

        public Funcionario buscarPorId(int id) {
                FuncionarioDAO funcionarioDAO = new FuncionarioDAO ();
                Funcionario funcionario = new Funcionario();
                funcionario = funcionarioDAO.buscarPorId(id);
                
                return funcionario;
            }

	public boolean excluir(int id) {
            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
           return funcionarioDAO.excluir(id); 
	    
	}

	public Funcionario alterarStatus() {
		return null;
	}
        	
        public Funcionario alterarFuncionario(Funcionario funcionario) {
            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
            funcionario = funcionarioDAO.alterarFuncionario(funcionario); 
            return funcionario;
	}

}
