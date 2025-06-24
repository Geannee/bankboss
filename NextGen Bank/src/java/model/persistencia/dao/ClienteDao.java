package model.persistencia.dao;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.persistencia.Cliente;
import model.persistencia.Endereco;

public class ClienteDao {

    private Connection conn;

    public ClienteDao() {
            try {
               if (this.conn == null || this.conn.isClosed()) {
                    this.conn = Conexao.conectar();
                }
            } catch (Exception e) {
                System.out.println("Erro ao inicializar conexão no DAO");
                e.printStackTrace();
            }

    }
    public Cliente cadastrar(Cliente cliente) {
            
            PreparedStatement stmtEndereco = null;
            PreparedStatement stmtUsuario = null;
            PreparedStatement stmtCliente = null;
            ResultSet rs = null;

        try {
            // query de ENDEREÇO
            String sqlEndereco = "INSERT INTO endereco (cep, local, numero_casa, bairro, cidade, estado, complemento) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmtEndereco = conn.prepareStatement(sqlEndereco, Statement.RETURN_GENERATED_KEYS);

            stmtEndereco.setString(1, cliente.getEndereco().getCep());
            stmtEndereco.setString(2, cliente.getEndereco().getLocal());
            stmtEndereco.setInt(3, cliente.getEndereco().getNumero_casa());
            stmtEndereco.setString(4, cliente.getEndereco().getBairro());
            stmtEndereco.setString(5, cliente.getEndereco().getCidade());
            stmtEndereco.setString(6, cliente.getEndereco().getEstado());
            stmtEndereco.setString(7, cliente.getEndereco().getComplemento());
            stmtEndereco.executeUpdate();//executa a operacao no banco
            rs = stmtEndereco.getGeneratedKeys();//retornar id do endereco
            int idEndereco = 0;
            if (rs.next()) {
                idEndereco = rs.getInt(1);
            }
            rs.close();
            stmtEndereco.close();
            
            // query USUÁRIO
            String sqlUsuario = "INSERT INTO usuario (nome, cpf, telefone, tipo_usuario, senha_hash, otp_ativo, id_endereco, data_nascimento) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmtUsuario = conn.prepareStatement(sqlUsuario, Statement.RETURN_GENERATED_KEYS);
            stmtUsuario.setString(1, cliente.getNome());
            stmtUsuario.setString(2, cliente.getCpf());
            stmtUsuario.setString(3, cliente.getTelefone());
            stmtUsuario.setString(4, "CLIENTE");
            stmtUsuario.setString(5, cliente.getSenha_hash());
            stmtUsuario.setString(6, cliente.getOtp_ativo());
          //  stmtUsuario.setTimestamp(8, new Timestamp(System.currentTimeMillis() + 5 * 60 * 1000)); // OTP válido por 5 min
            stmtUsuario.setInt(7, idEndereco);
            stmtUsuario.setDate(8, (Date) cliente.getData_nascimento());
            stmtUsuario.executeUpdate();
            rs = stmtUsuario.getGeneratedKeys();
            int idUsuario = 0;
            if (rs.next()) {
                idUsuario = rs.getInt(1);
            }
            rs.close();
            stmtUsuario.close();

            //Inserir CLIENTE
            String sqlCliente = "INSERT INTO cliente (id_usuario) VALUES (?)";
            stmtCliente = conn.prepareStatement(sqlCliente, Statement.RETURN_GENERATED_KEYS);
            //stmtCliente.setFloat(1, cliente.getScore_credito());
            stmtCliente.setInt(1, idUsuario);
            stmtCliente.executeUpdate();
            rs = stmtCliente.getGeneratedKeys();
            int idCliente = 0;
            if (rs.next()) {
                idCliente = rs.getInt(1);
            }
            // Atualiza os IDs no objeto
            cliente.setId_usuario(idUsuario);
            cliente.setId_cliente(idCliente);

            return cliente;
            
        } catch (SQLException e) {
            e.printStackTrace();
            e.getMessage();
            return null;
       } 
    }

    public List<Cliente> buscarTodos() throws SQLException {
        PreparedStatement stmt = null;
     
        try{
            String sqlCliente = "SELECT u.id_usuario, u.nome, u.cpf, u.telefone,"
                    + "c.id_cliente, c.score_credito,"
                    + "e.cep, e.local, e.numero_casa, e.bairro, e.cidade, e.estado "
                    + "FROM cliente as c "
                    + "JOIN usuario as u ON c.id_usuario = u.id_usuario "
                    + "JOIN endereco as e ON u.id_endereco = e.id_endereco";
            stmt = conn.prepareStatement(sqlCliente);
            ResultSet rs = stmt.executeQuery();
            
            List<Cliente> todos = new ArrayList<>();
       
            while (rs.next()) {
                Cliente cliente = new Cliente();
                int clienteId = rs.getInt("id_cliente");
                cliente.setId_cliente(clienteId);
                String nome = rs.getString("nome");
                cliente.setNome(nome);
                String cpf = rs.getString("cpf");
                cliente.setCpf(cpf);
                String telefone = rs.getString("telefone");
                cliente.setTelefone(telefone);

            // a cada loop adiciona o cliente na lista 
                todos.add(cliente);
            }
             return todos;
        }catch (SQLException e) {
            e.printStackTrace();
            e.getMessage();
            return null;
       }  
           
    }

        public List<Cliente> buscarPorNome(String nome) {

               PreparedStatement stmt = null;
    
               try{
                   String sqlCliente = "SELECT c.id_cliente, u.nome, u.cpf, u.telefone,e.cep, e.local, e.numero_casa, e.bairro, e.cidade, e.estado "
                           + "FROM cliente as c "
                           + "JOIN usuario as u ON c.id_usuario = u.id_usuario "
                           + "JOIN endereco as e ON u.id_endereco = e.id_endereco "
                           + "WHERE (u.nome) LIKE ?";
                               
                   stmt = conn.prepareStatement(sqlCliente);
                   stmt.setString(1, "%"+nome+"%");
                   
                   ResultSet rs = stmt.executeQuery();
                 
                   List<Cliente> todos = new ArrayList<>();

                   while (rs.next()) {
                       Cliente cliente = new Cliente();
                       int clienteId = rs.getInt("id_cliente");
                       cliente.setId_cliente(clienteId);
                       String nomeCliente = rs.getString("nome");
                       cliente.setNome(nomeCliente);
                       String cpf = rs.getString("cpf");
                       cliente.setCpf(cpf);
                       String telefone = rs.getString("telefone");
                       cliente.setTelefone(telefone);

                   // a cada loop adiciona o cliente na lista 
                       todos.add(cliente);
                   }
                    return todos;
               }catch (SQLException e) {
                   e.printStackTrace();
                   e.getMessage();
                   return null;
              }  
        }
	public Cliente buscarPorId(int id) {
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                String sqlCliente = "SELECT c.id_cliente, u.id_usuario, u.nome, u.cpf, u.telefone, u.data_nascimento, u.senha_hash, u.otp_ativo, " +
                                    "e.id_endereco, e.cep, e.local, e.numero_casa, e.bairro, e.cidade, e.estado, e.complemento " +
                                    "FROM cliente AS c " +
                                    "JOIN usuario AS u ON c.id_usuario = u.id_usuario " +
                                    "JOIN endereco AS e ON u.id_endereco = e.id_endereco " +
                                    "WHERE c.id_cliente = ?";
                stmt = conn.prepareStatement(sqlCliente);
                stmt.setInt(1, id);

                rs = stmt.executeQuery();

                if (rs.next()) {
                    Cliente cliente = new Cliente();
                    Endereco end = new Endereco();

                    // Cliente
                    cliente.setId_cliente(rs.getInt("id_cliente"));
                    cliente.setId_usuario(rs.getInt("id_usuario"));
                    cliente.setNome(rs.getString("nome"));
                    cliente.setCpf(rs.getString("cpf"));
                    cliente.setTelefone(rs.getString("telefone"));
                    cliente.setData_nascimento(rs.getDate("data_nascimento"));
                    cliente.setSenha_hash(rs.getString("senha_hash"));
                    cliente.setOtp_ativo(rs.getString("otp_ativo"));

                    // Endereço
                    end.setId_endereco(rs.getInt("id_endereco"));
                    end.setCep(rs.getString("cep"));
                    end.setLocal(rs.getString("local"));
                    end.setNumero_casa(rs.getInt("numero_casa"));
                    end.setBairro(rs.getString("bairro"));
                    end.setCidade(rs.getString("cidade"));
                    end.setEstado(rs.getString("estado"));
                    end.setComplemento(rs.getString("complemento"));

                    cliente.setEndereco(end);

                    return cliente;
                }

                return null; 
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            } 
		
	}

	public boolean excluir(int id) {
		return false;
	}
	public Cliente alterarStatus(int id) {
		return null;
	}
        public Cliente alterarCliente(Cliente cliente) {
                    PreparedStatement stmtEndereco = null;
        PreparedStatement stmtUsuario = null;

    try {
            conn.setAutoCommit(false); // controle transacao

            // Atualiza ENDEREÇO
            String sqlEndereco = "UPDATE endereco SET cep = ?, local = ?, numero_casa = ?, bairro = ?, cidade = ?, estado = ?, complemento = ? WHERE id_endereco = ?";
            stmtEndereco = conn.prepareStatement(sqlEndereco);
            stmtEndereco.setString(1, cliente.getEndereco().getCep());
            stmtEndereco.setString(2, cliente.getEndereco().getLocal());
            stmtEndereco.setInt(3, cliente.getEndereco().getNumero_casa());
            stmtEndereco.setString(4, cliente.getEndereco().getBairro());
            stmtEndereco.setString(5, cliente.getEndereco().getCidade());
            stmtEndereco.setString(6, cliente.getEndereco().getEstado());
            stmtEndereco.setString(7, cliente.getEndereco().getComplemento());
            stmtEndereco.setInt(8, cliente.getEndereco().getId_endereco());
            int linhasEndereco = stmtEndereco.executeUpdate();
            System.out.println(linhasEndereco);
            stmtEndereco.close();

            // Atualiza USUÁRIO
            String sqlUsuario = "UPDATE usuario SET nome = ?, cpf = ?, telefone = ?, senha_hash = ?, otp_ativo = ? WHERE id_usuario = ?";
            stmtUsuario = conn.prepareStatement(sqlUsuario);
            stmtUsuario.setString(1, cliente.getNome());
            stmtUsuario.setString(2, cliente.getCpf());
            stmtUsuario.setString(3, cliente.getTelefone());
            stmtUsuario.setString(4, cliente.getSenha_hash());
            stmtUsuario.setString(5, cliente.getOtp_ativo());
            stmtUsuario.setInt(6, cliente.getId_usuario());
            int linhasUsuario = stmtUsuario.executeUpdate();
            System.out.println(linhasUsuario);
            stmtUsuario.close();

            // Verifica se atualizou
            if (linhasEndereco == 0 || linhasUsuario == 0) {
                conn.rollback();
                return null;
            }

            conn.commit(); // <--- essencial

            return cliente;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
    }
}


