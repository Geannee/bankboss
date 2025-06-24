package controller;

import java.util.List;
import model.persistencia.Cliente;
import model.persistencia.dao.ClienteDao;
//import model.persistencia.util.TipoUsuario;
import model.persistencia.dao.Conexao;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClienteController {

	public Cliente cadastrar(Cliente cliente) {
           ClienteDao clienteDao = new ClienteDao();
           cliente = clienteDao.cadastrar(cliente); 
           return cliente;
	}

	public List<Cliente> buscarTodos() throws SQLException {
            ClienteDao clienteDao = new ClienteDao();
            List<Cliente> todos = new ArrayList<>();
            todos = clienteDao.buscarTodos();
            return todos;
	}

	public List<Cliente> buscarPorNome(String nome) {
            ClienteDao clienteDao = new ClienteDao();
            List<Cliente> todos = new ArrayList<>();
            todos = clienteDao.buscarPorNome(nome);
            return todos;
	}

        public Cliente buscarPorId(int id) {
                ClienteDao clienteDao = new ClienteDao();
                Cliente cliente = new Cliente();
                cliente = clienteDao.buscarPorId(id);
                return cliente;
            }

	public boolean excluir(int id) {
            ClienteDao clienteDao = new ClienteDao();
            clienteDao.excluir(id);
	    return true;
	}

	public Cliente alterarStatus() {
		return null;
	}
        	
        public Cliente alterarCliente(Cliente cliente) {
            ClienteDao clienteDao = new ClienteDao();
            cliente = clienteDao.alterarCliente(cliente);
            return cliente;
	}

}
