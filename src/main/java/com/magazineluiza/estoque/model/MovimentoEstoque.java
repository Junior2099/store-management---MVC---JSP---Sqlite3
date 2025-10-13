package com.magazineluiza.estoque.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class MovimentoEstoque implements Serializable {
    public enum Tipo { ENTRADA, SAIDA }

    private Integer id;
    private Integer produtoId;
    private Integer quantidade;
    private Tipo tipo;
    private LocalDateTime dataHora;
    private String observacao;

    public MovimentoEstoque() {
    }

    public MovimentoEstoque(Integer id, Integer produtoId, Integer quantidade, Tipo tipo, LocalDateTime dataHora, String observacao) {
        this.id = id;
        this.produtoId = produtoId;
        this.quantidade = quantidade;
        this.tipo = tipo;
        this.dataHora = dataHora;
        this.observacao = observacao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(Integer produtoId) {
        this.produtoId = produtoId;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

    public LocalDateTime getDataHora() {
        return dataHora;
    }

    public void setDataHora(LocalDateTime dataHora) {
        this.dataHora = dataHora;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
}


