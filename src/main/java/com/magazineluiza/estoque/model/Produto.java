package com.magazineluiza.estoque.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Produto implements Serializable {
    private Integer id;
    private String nome;
    private Integer categoriaId;
    private BigDecimal preco;
    private Integer quantidade;

    public Produto() {
    }

    public Produto(Integer id, String nome, Integer categoriaId, BigDecimal preco, Integer quantidade) {
        this.id = id;
        this.nome = nome;
        this.categoriaId = categoriaId;
        this.preco = preco;
        this.quantidade = quantidade;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getCategoriaId() {
        return categoriaId;
    }

    public void setCategoriaId(Integer categoriaId) {
        this.categoriaId = categoriaId;
    }

    public BigDecimal getPreco() {
        return preco;
    }

    public void setPreco(BigDecimal preco) {
        this.preco = preco;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
}


