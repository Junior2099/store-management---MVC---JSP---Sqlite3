package com.magazineluiza.estoque.repository;

import com.magazineluiza.estoque.model.Categoria;
import com.magazineluiza.estoque.model.MovimentoEstoque;
import com.magazineluiza.estoque.model.Produto;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class Database {
    static {
        try {
            SQLite.initialize();
        } catch (Exception e) {
            e.printStackTrace();
            // Evita falha de inicialização da classe
        }
    }

    // Categoria
    public static synchronized List<Categoria> listarCategorias() {
        List<Categoria> out = new ArrayList<>();
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("SELECT id, nome FROM categoria ORDER BY nome");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                out.add(new Categoria(rs.getInt("id"), rs.getString("nome")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return out;
    }

    public static synchronized Categoria addCategoria(Categoria categoria) {
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("INSERT INTO categoria(nome) VALUES(?)", Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, categoria.getNome());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) categoria.setId(rs.getInt(1));
            }
            return categoria;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static synchronized Optional<Categoria> obterCategoria(int id) {
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("SELECT id, nome FROM categoria WHERE id=?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return Optional.of(new Categoria(rs.getInt("id"), rs.getString("nome")));
            }
            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static synchronized void atualizarCategoria(Categoria categoria) {
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("UPDATE categoria SET nome=? WHERE id=?")) {
            ps.setString(1, categoria.getNome());
            ps.setInt(2, categoria.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static synchronized void removerCategoria(int id) {
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("DELETE FROM categoria WHERE id=?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Produto
    public static synchronized List<Produto> listarProdutos() {
        List<Produto> out = new ArrayList<>();
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("SELECT id, nome, categoria_id, preco, quantidade FROM produto ORDER BY id DESC");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Produto p = new Produto(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("categoria_id"),
                        rs.getBigDecimal("preco"),
                        rs.getInt("quantidade"));
                out.add(p);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return out;
    }

    public static synchronized Produto addProduto(Produto produto) {
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("INSERT INTO produto(nome, categoria_id, preco, quantidade) VALUES(?,?,?,?)", Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, produto.getNome());
            ps.setInt(2, produto.getCategoriaId());
            ps.setBigDecimal(3, produto.getPreco());
            ps.setInt(4, produto.getQuantidade());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) produto.setId(rs.getInt(1));
            }
            return produto;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static synchronized Optional<Produto> obterProduto(int id) {
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("SELECT id, nome, categoria_id, preco, quantidade FROM produto WHERE id=?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Produto p = new Produto(
                            rs.getInt("id"),
                            rs.getString("nome"),
                            rs.getInt("categoria_id"),
                            rs.getBigDecimal("preco"),
                            rs.getInt("quantidade"));
                    return Optional.of(p);
                }
            }
            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static synchronized void atualizarProduto(Produto produto) {
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("UPDATE produto SET nome=?, categoria_id=?, preco=?, quantidade=? WHERE id=?")) {
            ps.setString(1, produto.getNome());
            ps.setInt(2, produto.getCategoriaId());
            ps.setBigDecimal(3, produto.getPreco());
            ps.setInt(4, produto.getQuantidade());
            ps.setInt(5, produto.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static synchronized void removerProduto(int id) {
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("DELETE FROM produto WHERE id=?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static synchronized List<Produto> listarProdutosPorCategoria(int categoriaId) {
        List<Produto> out = new ArrayList<>();
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("SELECT id, nome, categoria_id, preco, quantidade FROM produto WHERE categoria_id=? ORDER BY nome")) {
            ps.setInt(1, categoriaId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    out.add(new Produto(
                            rs.getInt("id"),
                            rs.getString("nome"),
                            rs.getInt("categoria_id"),
                            rs.getBigDecimal("preco"),
                            rs.getInt("quantidade")));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return out;
    }

    // Movimento de estoque
    public static synchronized List<MovimentoEstoque> listarMovimentos() {
        List<MovimentoEstoque> out = new ArrayList<>();
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("SELECT id, produto_id, quantidade, tipo, data_hora, observacao FROM movimento ORDER BY id DESC");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String dataStr = rs.getString("data_hora");
                if (dataStr != null && dataStr.indexOf('T') < 0 && dataStr.indexOf(' ') >= 0) {
                    dataStr = dataStr.replace(' ', 'T');
                }
                MovimentoEstoque m = new MovimentoEstoque(
                        rs.getInt("id"),
                        rs.getInt("produto_id"),
                        rs.getInt("quantidade"),
                        "ENTRADA".equals(rs.getString("tipo")) ? MovimentoEstoque.Tipo.ENTRADA : MovimentoEstoque.Tipo.SAIDA,
                        LocalDateTime.parse(dataStr),
                        rs.getString("observacao"));
                out.add(m);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return out;
    }

    public static synchronized MovimentoEstoque addMovimento(MovimentoEstoque movimento) {
        try (Connection c = SQLite.getConnection()) {
            c.setAutoCommit(false);
            try (PreparedStatement ps = c.prepareStatement("INSERT INTO movimento(produto_id, quantidade, tipo, data_hora, observacao) VALUES(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, movimento.getProdutoId());
                ps.setInt(2, movimento.getQuantidade());
                ps.setString(3, movimento.getTipo() == MovimentoEstoque.Tipo.ENTRADA ? "ENTRADA" : "SAIDA");
                ps.setString(4, movimento.getDataHora().toString());
                ps.setString(5, movimento.getObservacao());
                ps.executeUpdate();
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) movimento.setId(rs.getInt(1));
                }
            }
            // Atualiza estoque
            String sqlEstoque = "UPDATE produto SET quantidade = quantidade + ? WHERE id = ?";
            int fator = movimento.getTipo() == MovimentoEstoque.Tipo.ENTRADA ? 1 : -1;
            try (PreparedStatement ps2 = c.prepareStatement(sqlEstoque)) {
                ps2.setInt(1, fator * movimento.getQuantidade());
                ps2.setInt(2, movimento.getProdutoId());
                ps2.executeUpdate();
            }
            c.commit();
            c.setAutoCommit(true);
            return movimento;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static synchronized List<MovimentoEstoque> listarMovimentosPorProduto(int produtoId) {
        List<MovimentoEstoque> out = new ArrayList<>();
        try (Connection c = SQLite.getConnection();
             PreparedStatement ps = c.prepareStatement("SELECT id, produto_id, quantidade, tipo, data_hora, observacao FROM movimento WHERE produto_id=? ORDER BY id DESC")) {
            ps.setInt(1, produtoId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    out.add(new MovimentoEstoque(
                            rs.getInt("id"),
                            rs.getInt("produto_id"),
                            rs.getInt("quantidade"),
                            "ENTRADA".equals(rs.getString("tipo")) ? MovimentoEstoque.Tipo.ENTRADA : MovimentoEstoque.Tipo.SAIDA,
                            LocalDateTime.parse(rs.getString("data_hora")),
                            rs.getString("observacao")));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return out;
    }
}


