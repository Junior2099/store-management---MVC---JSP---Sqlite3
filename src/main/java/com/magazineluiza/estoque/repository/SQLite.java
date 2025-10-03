package com.magazineluiza.estoque.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLite {
    private static final String JDBC_URL = "jdbc:sqlite:estoque.db"; // arquivo no diretório de execução

    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(JDBC_URL);
        try (Statement st = conn.createStatement()) {
            st.execute("PRAGMA foreign_keys = ON");
        }
        return conn;
    }

    public static void initialize() {
        try (Connection conn = getConnection(); Statement st = conn.createStatement()) {
            st.execute("CREATE TABLE IF NOT EXISTS categoria (" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "nome TEXT NOT NULL UNIQUE" +
                    ")");
            
            st.execute("CREATE TABLE IF NOT EXISTS produto (" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "nome TEXT NOT NULL, " +
                    "categoria_id INTEGER NOT NULL, " +
                    "preco NUMERIC NOT NULL, " +
                    "quantidade INTEGER NOT NULL DEFAULT 0, " +
                    "FOREIGN KEY(categoria_id) REFERENCES categoria(id) ON DELETE CASCADE" +
                    ")");

            st.execute("CREATE TABLE IF NOT EXISTS movimento (" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "produto_id INTEGER NOT NULL, " +
                    "quantidade INTEGER NOT NULL, " +
                    "tipo TEXT NOT NULL CHECK(tipo IN ('ENTRADA','SAIDA')), " +
                    "data_hora TEXT NOT NULL, " +
                    "observacao TEXT, " +
                    "FOREIGN KEY(produto_id) REFERENCES produto(id) ON DELETE CASCADE" +
                    ")");

            // Seed mínimo se vazio
            st.execute("INSERT INTO categoria(nome) SELECT 'Eletrônicos' WHERE NOT EXISTS(SELECT 1 FROM categoria)");
            st.execute("INSERT INTO categoria(nome) SELECT 'Móveis' WHERE (SELECT COUNT(*) FROM categoria)=1");

            // Seed de produtos (somente se não houver nenhum)
            st.execute("INSERT INTO produto(nome, categoria_id, preco, quantidade) \n" +
                    "SELECT 'Smartphone XYZ', (SELECT id FROM categoria WHERE nome='Eletrônicos'), 1999.90, 50 \n" +
                    "WHERE NOT EXISTS(SELECT 1 FROM produto)");
            st.execute("INSERT INTO produto(nome, categoria_id, preco, quantidade) \n" +
                    "SELECT 'Smart TV 55 polegadas', (SELECT id FROM categoria WHERE nome='Eletrônicos'), 3499.00, 20 \n" +
                    "WHERE (SELECT COUNT(*) FROM produto)=1");
            st.execute("INSERT INTO produto(nome, categoria_id, preco, quantidade) \n" +
                    "SELECT 'Sofá 3 lugares', (SELECT id FROM categoria WHERE nome='Móveis'), 2299.00, 10 \n" +
                    "WHERE (SELECT COUNT(*) FROM produto)=2");

            // Seed de movimentos (somente se não houver)
            st.execute("INSERT INTO movimento(produto_id, quantidade, tipo, data_hora, observacao) \n" +
                    "SELECT p.id, 10, 'ENTRADA', datetime('now','-1 day'), 'Reposição inicial' FROM produto p WHERE NOT EXISTS(SELECT 1 FROM movimento) AND p.nome='Smartphone XYZ'");
            st.execute("INSERT INTO movimento(produto_id, quantidade, tipo, data_hora, observacao) \n" +
                    "SELECT p.id, 2, 'SAIDA', datetime('now','-10 hours'), 'Venda' FROM produto p WHERE (SELECT COUNT(*) FROM movimento)=1 AND p.nome='Smartphone XYZ'");
            st.execute("INSERT INTO movimento(produto_id, quantidade, tipo, data_hora, observacao) \n" +
                    "SELECT p.id, 5, 'ENTRADA', datetime('now','-20 hours'), 'Chegada de carga' FROM produto p WHERE (SELECT COUNT(*) FROM movimento)=2 AND p.nome='Smart TV 55 polegadas'");

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inicializar SQLite", e);
        }
    }
}


