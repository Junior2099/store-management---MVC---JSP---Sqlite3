package com.paraisografica.dao;

import com.paraisografica.model.Material;
import com.paraisografica.util.DatabaseConnection;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO para operações com materiais
 */
public class MaterialDAO {

    /**
     * Lista todos os materiais
     */
    public List<Material> listarTodos() throws SQLException {
        List<Material> materiais = new ArrayList<>();
        String sql = "SELECT * FROM materiais ORDER BY nome";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                materiais.add(mapearResultSet(rs));
            }
        }
        return materiais;
    }

    /**
     * Busca um material pelo ID
     */
    public Material buscarPorId(int id) throws SQLException {
        String sql = "SELECT * FROM materiais WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapearResultSet(rs);
                }
            }
        }
        return null;
    }

    /**
     * Insere um novo material
     */
    public boolean inserir(Material material) throws SQLException {
        String sql = "INSERT INTO materiais (nome, descricao, categoria, quantidade, preco_unitario, fornecedor, data_cadastro, data_atualizacao) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, material.getNome());
            stmt.setString(2, material.getDescricao());
            stmt.setString(3, material.getCategoria());
            stmt.setInt(4, material.getQuantidade());
            stmt.setDouble(5, material.getPrecoUnitario());
            stmt.setString(6, material.getFornecedor());
            
            String now = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            stmt.setString(7, now);
            stmt.setString(8, now);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Para SQLite, vamos buscar o ID usando last_insert_rowid()
                try (PreparedStatement idStmt = conn.prepareStatement("SELECT last_insert_rowid()")) {
                    try (ResultSet rs = idStmt.executeQuery()) {
                        if (rs.next()) {
                            material.setId(rs.getInt(1));
                        }
                    }
                }
                return true;
            }
        }
        return false;
    }

    /**
     * Atualiza um material existente
     */
    public boolean atualizar(Material material) throws SQLException {
        String sql = "UPDATE materiais " +
                "SET nome = ?, descricao = ?, categoria = ?, quantidade = ?, preco_unitario = ?, fornecedor = ?, data_atualizacao = ? " +
                "WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, material.getNome());
            stmt.setString(2, material.getDescricao());
            stmt.setString(3, material.getCategoria());
            stmt.setInt(4, material.getQuantidade());
            stmt.setDouble(5, material.getPrecoUnitario());
            stmt.setString(6, material.getFornecedor());
            stmt.setString(7, LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
            stmt.setInt(8, material.getId());

            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Remove um material
     */
    public boolean remover(int id) throws SQLException {
        String sql = "DELETE FROM materiais WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

    /**
     * Busca materiais por categoria
     */
    public List<Material> buscarPorCategoria(String categoria) throws SQLException {
        List<Material> materiais = new ArrayList<>();
        String sql = "SELECT * FROM materiais WHERE categoria = ? ORDER BY nome";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoria);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    materiais.add(mapearResultSet(rs));
                }
            }
        }
        return materiais;
    }

    /**
     * Busca materiais por nome (busca parcial)
     */
    public List<Material> buscarPorNome(String nome) throws SQLException {
        List<Material> materiais = new ArrayList<>();
        String sql = "SELECT * FROM materiais WHERE nome LIKE ? ORDER BY nome";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + nome + "%");

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    materiais.add(mapearResultSet(rs));
                }
            }
        }
        return materiais;
    }

    /**
     * Lista todas as categorias únicas
     */
    public List<String> listarCategorias() throws SQLException {
        List<String> categorias = new ArrayList<>();
        String sql = "SELECT DISTINCT categoria FROM materiais ORDER BY categoria";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                categorias.add(rs.getString("categoria"));
            }
        }
        return categorias;
    }

    /**
     * Mapeia um ResultSet para um objeto Material
     */
    private Material mapearResultSet(ResultSet rs) throws SQLException {
        Material material = new Material();
        material.setId(rs.getInt("id"));
        material.setNome(rs.getString("nome"));
        material.setDescricao(rs.getString("descricao"));
        material.setCategoria(rs.getString("categoria"));
        material.setQuantidade(rs.getInt("quantidade"));
        material.setPrecoUnitario(rs.getDouble("preco_unitario"));
        material.setFornecedor(rs.getString("fornecedor"));
        
        // Converter strings de data para LocalDateTime
        String dataCadastroStr = rs.getString("data_cadastro");
        String dataAtualizacaoStr = rs.getString("data_atualizacao");
        
        if (dataCadastroStr != null) {
            material.setDataCadastro(LocalDateTime.parse(dataCadastroStr));
        }
        if (dataAtualizacaoStr != null) {
            material.setDataAtualizacao(LocalDateTime.parse(dataAtualizacaoStr));
        }
        
        return material;
    }
}
