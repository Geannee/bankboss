package model.persistencia.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.persistencia.Funcionario;
import model.persistencia.Endereco;

public class FuncionarioDAO {

    private Connection conn;

    public FuncionarioDAO() {
        try {
            if (this.conn == null || this.conn.isClosed()) {
                this.conn = Conexao.conectar();
            }
        } catch (Exception e) {
            System.out.println("Erro ao inicializar conexão no DAO");
            e.printStackTrace();
        }
    }

    public Funcionario cadastrar(Funcionario funcionario) {
        PreparedStatement stmtEndereco = null;
        PreparedStatement stmtUsuario = null;
        PreparedStatement stmtFuncionario = null;
        ResultSet rs = null;

        try {
            // Inserir Endereco
            String sqlEndereco = "INSERT INTO endereco(cep, local, numero_casa, bairro, cidade, estado, complemento) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmtEndereco = conn.prepareStatement(sqlEndereco, Statement.RETURN_GENERATED_KEYS);
            stmtEndereco.setString(1, funcionario.getEndereco().getCep());
            stmtEndereco.setString(2, funcionario.getEndereco().getLocal());
            stmtEndereco.setInt(3, funcionario.getEndereco().getNumero_casa());
            stmtEndereco.setString(4, funcionario.getEndereco().getBairro());
            stmtEndereco.setString(5, funcionario.getEndereco().getCidade());
            stmtEndereco.setString(6, funcionario.getEndereco().getEstado());
            stmtEndereco.setString(7, funcionario.getEndereco().getComplemento());
            stmtEndereco.executeUpdate();

            rs = stmtEndereco.getGeneratedKeys();
            int idEndereco = 0;
            if (rs.next()) {
                idEndereco = rs.getInt(1);
            }
            rs.close();
            stmtEndereco.close();

            // Inserir Usuario
            String sqlUsuario = "INSERT INTO usuario (nome, cpf, senha_hash, id_endereco) VALUES (?, ?, ?, ?)";
            stmtUsuario = conn.prepareStatement(sqlUsuario, Statement.RETURN_GENERATED_KEYS);
            stmtUsuario.setString(1, funcionario.getNome());
            stmtUsuario.setString(2, funcionario.getCpf());
            stmtUsuario.setString(3, funcionario.getSenha_hash());
            stmtUsuario.setInt(4, idEndereco);
            stmtUsuario.executeUpdate();

            rs = stmtUsuario.getGeneratedKeys();
            int idUsuario = 0;
            if (rs.next()) {
                idUsuario = rs.getInt(1);
            }
            rs.close();
            stmtUsuario.close();

            // Inserir Funcionario
            String sqlFuncionario = "INSERT INTO funcionario (id_usuario, cod_funcionario, cargo) VALUES (?, ?, ?)";
            stmtFuncionario = conn.prepareStatement(sqlFuncionario, Statement.RETURN_GENERATED_KEYS);
            stmtFuncionario.setInt(1, idUsuario);
            stmtFuncionario.setInt(2, funcionario.getCod_funcionario());
            stmtFuncionario.setInt(3, funcionario.getCargo());
            stmtFuncionario.executeUpdate();

            rs = stmtFuncionario.getGeneratedKeys();
            int idFuncionario = 0;
            if (rs.next()) {
                idFuncionario = rs.getInt(1);
            }
            rs.close();
            stmtFuncionario.close();

            funcionario.setId_usuario(idUsuario);
            funcionario.setId_funcionario(idFuncionario);

            return funcionario;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

       
        

        public List<Funcionario> buscarTodos() throws SQLException {
        PreparedStatement stmt = null;
     
        try{
            String sqlFuncionario = "SELECT c.id_funcionario, u.nome, u.cpf, u.telefone,e.cep, e.local, e.numero_casa, e.bairro, e.cidade, e.estado "
                    + "FROM funcionario as f "
                    + "JOIN usuario as u ON c.id_usuario = u.id_usuario "
                    + "JOIN endereco as e ON u.id_endereco = e.id_endereco";
            stmt = conn.prepareStatement(sqlFuncionario);
            ResultSet rs = stmt.executeQuery();
            
            List<Funcionario> todos = new ArrayList<>();
       
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                int funcionarioId = rs.getInt("id_funcionario");
                funcionario.setId_funcionario(funcionarioId);
                String nome = rs.getString("nome");
                funcionario.setNome(nome);
                String cpf = rs.getString("cpf");
                funcionario.setCpf(cpf);
                String telefone = rs.getString("telefone");
                funcionario.setTelefone(telefone);

            // a cada loop adiciona o funcionario na lista 
                todos.add(funcionario);
            }
             return todos;
        }catch (SQLException e) {
            e.printStackTrace();
            e.getMessage();
            return null;
       }  
}
        public List<Funcionario> buscarPorNome(String nome){
            
            PreparedStatement stmt = null;
            
             try{
                   String sqlFuncionario =  "SELECT f.id_funcionario, f.cod_funcionario, f.cargo, " +
                        "u.id_usuario, u.nome, u.cpf, u.telefone, " +
                        "e.id_endereco, e.cep, e.local, e.numero_casa, e.bairro, e.cidade, e.estado, e.complemento " +
                        "FROM funcionario AS f " +
                        "JOIN usuario AS u ON f.id_usuario = u.id_usuario " +
                        "JOIN endereco AS e ON u.id_endereco = e.id_endereco";
                               
                   stmt = conn.prepareStatement(sqlFuncionario);
                   stmt.setString(1, "%"+nome+"%");
                   
                   ResultSet rs = stmt.executeQuery();
                 
                   List<Funcionario> todos = new ArrayList<>();

                   while (rs.next()) {
                       Funcionario funcionario = new Funcionario();
                       int funcionarioId = rs.getInt("id_funcionario");
                       funcionario.setId_funcionario(funcionarioId);
                       String nomeFuncionario = rs.getString("nome");
                       funcionario.setNome(nomeFuncionario);
                       String cpf = rs.getString("cpf");
                       funcionario.setCpf(cpf);
                       String telefone = rs.getString("telefone");
                       funcionario.setTelefone(telefone);

                   // a cada loop adiciona o cliente na lista 
                       todos.add(funcionario);
                   }
                    return todos;
                    }catch (SQLException e) {
                        e.printStackTrace();
                        e.getMessage();
                        return null;
                   }  
}
                    public Funcionario buscarPorId(int id) {
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
            
                   
            try{
                String sqlFuncionario = "SELECT f.id_funcionario, u.id_usuario, u.nome, u.cpf, u.telefone, u.data_nascimento, u.senha_hash, u.otp_ativo, " +
                                    "e.id_endereco, e.cep, e.local, e.numero_casa, e.bairro, e.cidade, e.estado, e.complemento " +
                                    "FROM funcionario AS f " +
                                    "JOIN funcionario AS f ON f.id_funcionario = u.id_usuario " +
                                    "JOIN endereco AS e ON u.id_endereco = e.id_endereco " +
                                    "WHERE f.id_funcioario = ?";
                stmt = conn.prepareStatement(sqlFuncionario);
                stmt.setInt(1, id);

                rs = stmt.executeQuery();

                if (rs.next()) {
                    Funcionario funcionario = new Funcionario();
                    Endereco end = new Endereco();

                    // funcionario
                    funcionario.setId_funcionario(rs.getInt("id_funcionario"));
                    funcionario.setId_usuario(rs.getInt("id_usuario"));
                    funcionario.setNome(rs.getString("nome"));
                    funcionario.setCpf(rs.getString("cpf"));
                    funcionario.setTelefone(rs.getString("telefone"));
                    funcionario.setData_nascimento(rs.getDate("data_nascimento"));
                    funcionario.setSenha_hash(rs.getString("senha_hash"));
                    funcionario.setOtp_ativo(rs.getString("otp_ativo"));

                    // Endereço
                    end.setId_endereco(rs.getInt("id_endereco"));
                    end.setCep(rs.getString("cep"));
                    end.setLocal(rs.getString("local"));
                    end.setNumero_casa(rs.getInt("numero_casa"));
                    end.setBairro(rs.getString("bairro"));
                    end.setCidade(rs.getString("cidade"));
                    end.setEstado(rs.getString("estado"));
                    end.setComplemento(rs.getString("complemento"));

                   funcionario.setEndereco(end);

                    return funcionario;
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
	public Funcionario alterarStatus(int id) {
		return null;
	}
        public Funcionario alterarFuncionario(Funcionario funcionario) {
                    PreparedStatement stmtEndereco = null;
    PreparedStatement stmtUsuario = null;

    try {
            conn.setAutoCommit(false); // controle transacao

            // Atualiza ENDEREÇO
            String sqlEndereco = "UPDATE endereco SET cep = ?, local = ?, numero_casa = ?, bairro = ?, cidade = ?, estado = ?, complemento = ? WHERE id_endereco = ?";
            stmtEndereco = conn.prepareStatement(sqlEndereco);
            stmtEndereco.setString(1,funcionario.getEndereco().getCep());
            stmtEndereco.setString(2, funcionario.getEndereco().getLocal());
            stmtEndereco.setInt(3, funcionario.getEndereco().getNumero_casa());
            stmtEndereco.setString(4, funcionario.getEndereco().getBairro());
            stmtEndereco.setString(5, funcionario.getEndereco().getCidade());
            stmtEndereco.setString(6, funcionario.getEndereco().getEstado());
            stmtEndereco.setString(7, funcionario.getEndereco().getComplemento());
            stmtEndereco.setInt(8, funcionario.getEndereco().getId_endereco());
            int linhasEndereco = stmtEndereco.executeUpdate();
            System.out.println(linhasEndereco);
            stmtEndereco.close();

            // Atualiza USUÁRIO
           String sqlUsuario = "UPDATE usuario SET nome = ?, cpf = ?, telefone = ?, senha_hash = ?, otp_ativo = ? WHERE id_usuario = ?";
            stmtUsuario = conn.prepareStatement(sqlUsuario);
            stmtUsuario.setString(1, funcionario.getNome());
            stmtUsuario.setString(2, funcionario.getCpf());
            stmtUsuario.setString(3, funcionario.getTelefone());
            stmtUsuario.setString(4, funcionario.getSenha_hash());
            stmtUsuario.setString(5, funcionario.getOtp_ativo());
            stmtUsuario.setInt(6, funcionario.getId_usuario());
            int linhasUsuario = stmtUsuario.executeUpdate();
            System.out.println(linhasUsuario);
            stmtUsuario.close();

            // Verifica se atualizou
            if (linhasEndereco == 0 || linhasUsuario == 0) {
                conn.rollback();
                return null;
            }

            conn.commit(); // <--- essencial

            return funcionario;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
    }

    
}




 

   
        
        
        
        