package com.paraisografica.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Classe utilitária para gerenciar conexões com o banco SQLite
 */
public class DatabaseConnection {
    private static final String DB_URL = "jdbc:sqlite:database/paraisografica.db";
    private static Connection connection = null;

    /**
     * Obtém uma conexão com o banco de dados
     */
    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                Class.forName("org.sqlite.JDBC");
                connection = DriverManager.getConnection(DB_URL);
                initializeDatabase();
            } catch (ClassNotFoundException e) {
                throw new SQLException("Driver SQLite não encontrado", e);
            }
        }
        return connection;
    }

    /**
     * Inicializa o banco de dados criando as tabelas necessárias
     */
    private static void initializeDatabase() throws SQLException {
        try (Statement stmt = connection.createStatement()) {
            // Criar tabela de usuários
            String createUsuariosTable = "CREATE TABLE IF NOT EXISTS usuarios (" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
                    "username TEXT UNIQUE NOT NULL," +
                    "password TEXT NOT NULL," +
                    "nome TEXT NOT NULL," +
                    "email TEXT," +
                    "role TEXT DEFAULT 'USER'" +
                    ")";
            stmt.execute(createUsuariosTable);

            // Criar tabela de materiais
            String createMateriaisTable = "CREATE TABLE IF NOT EXISTS materiais (" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
                    "nome TEXT NOT NULL," +
                    "descricao TEXT," +
                    "categoria TEXT NOT NULL," +
                    "quantidade INTEGER NOT NULL DEFAULT 0," +
                    "preco_unitario REAL NOT NULL DEFAULT 0.0," +
                    "fornecedor TEXT," +
                    "data_cadastro TEXT NOT NULL," +
                    "data_atualizacao TEXT NOT NULL" +
                    ")";
            stmt.execute(createMateriaisTable);

            // Inserir usuário admin padrão se não existir
            String checkAdmin = "SELECT COUNT(*) FROM usuarios WHERE username = 'admin'";
            try (var rs = stmt.executeQuery(checkAdmin)) {
                if (rs.getInt(1) == 0) {
                    String insertAdmin = "INSERT INTO usuarios (username, password, nome, email, role) " +
                            "VALUES ('admin', 'admin', 'Administrador', 'admin@paraisografica.com', 'ADMIN')";
                    stmt.execute(insertAdmin);
                }
            }

            // Inserir alguns materiais de exemplo
            String checkMateriais = "SELECT COUNT(*) FROM materiais";
            try (var rs = stmt.executeQuery(checkMateriais)) {
                if (rs.getInt(1) == 0) {
                    String now = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
                    
                    String insertMateriais = "INSERT INTO materiais (nome, descricao, categoria, quantidade, preco_unitario, fornecedor, data_cadastro, data_atualizacao) VALUES " +
                            "('Papel A4 75g', 'Papel branco A4 75g/m²', 'Papel', 1000, 0.15, 'Papelaria Central', ?, ?), " +
                            "('Tinta Preta HP', 'Tinta preta para impressora HP', 'Tinta', 50, 25.90, 'TecnoInk', ?, ?), " +
                            "('Cartão 300g', 'Cartão branco 300g/m²', 'Papel', 200, 0.45, 'Papelaria Central', ?, ?), " +
                            "('Tinta Colorida Canon', 'Kit tinta colorida Canon', 'Tinta', 30, 89.90, 'TecnoInk', ?, ?), " +
                            "('Envelope A4', 'Envelope branco A4', 'Acessórios', 500, 0.08, 'Acessórios Gráficos', ?, ?)";
                    stmt.execute(insertMateriais.replace("?", "'" + now + "'"));
                }
            }

        } catch (SQLException e) {
            System.err.println("Erro ao inicializar banco de dados: " + e.getMessage());
            throw e;
        }
    }

    /**
     * Fecha a conexão com o banco de dados
     */
    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar conexão: " + e.getMessage());
        }
    }
}
