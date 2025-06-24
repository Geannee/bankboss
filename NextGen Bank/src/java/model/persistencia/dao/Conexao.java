package model.persistencia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    static String usuario = "root";
    static String senha = "Lu181922";
    static String url = "jdbc:mysql://localhost:3306/NextGenBank";
    static String driver = "com.mysql.cj.jdbc.Driver";
    
    static Connection conexao = null;
    
    // Método que irá ativar a conexão    
    public static Connection conectar() {
        try {
            if (conexao == null) {
                Class.forName(driver);
                conexao = DriverManager.getConnection(url, usuario, senha);
                System.out.println("Conexão ativa: " + conexao.getClass().getName());

                // Exibe o nome do banco de dados conectado
                String nomeBanco = conexao.getCatalog();
                System.out.println("Banco de dados conectado: " + nomeBanco);
            }
        } catch (Exception e) {
            System.out.println("Conexão falhou");
            e.printStackTrace(); // melhor mostrar o erro
        }
        return conexao;
    }

    // Método para encerrar a conexão (boa prática)
    public static void desconectar() {
        try {
            if (conexao != null && !conexao.isClosed()) {
                conexao.close();
                System.out.println("Conexão encerrada.");
            }
        } catch (SQLException e) {
            System.out.println("Erro ao encerrar a conexão.");
            e.printStackTrace();
        }
    }
}