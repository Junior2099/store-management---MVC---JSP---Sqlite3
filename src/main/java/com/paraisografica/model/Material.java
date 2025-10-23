package com.paraisografica.model;

import java.time.LocalDateTime;

/**
 * Modelo para representar um material da gráfica
 */
public class Material {
    private int id;
    private String nome;
    private String descricao;
    private String categoria;
    private int quantidade;
    private double precoUnitario;
    private String fornecedor;
    private LocalDateTime dataCadastro;
    private LocalDateTime dataAtualizacao;

    // Construtores
    public Material() {
        this.dataCadastro = LocalDateTime.now();
        this.dataAtualizacao = LocalDateTime.now();
    }

    public Material(String nome, String descricao, String categoria, int quantidade, 
                   double precoUnitario, String fornecedor) {
        this();
        this.nome = nome;
        this.descricao = descricao;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.precoUnitario = precoUnitario;
        this.fornecedor = fornecedor;
    }

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getPrecoUnitario() {
        return precoUnitario;
    }

    public void setPrecoUnitario(double precoUnitario) {
        this.precoUnitario = precoUnitario;
    }

    public String getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(String fornecedor) {
        this.fornecedor = fornecedor;
    }

    public LocalDateTime getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(LocalDateTime dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public LocalDateTime getDataAtualizacao() {
        return dataAtualizacao;
    }

    public void setDataAtualizacao(LocalDateTime dataAtualizacao) {
        this.dataAtualizacao = dataAtualizacao;
    }

    public double getValorTotal() {
        return quantidade * precoUnitario;
    }

    @Override
    public String toString() {
        return "Material{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", descricao='" + descricao + '\'' +
                ", categoria='" + categoria + '\'' +
                ", quantidade=" + quantidade +
                ", precoUnitario=" + precoUnitario +
                ", fornecedor='" + fornecedor + '\'' +
                ", dataCadastro=" + dataCadastro +
                ", dataAtualizacao=" + dataAtualizacao +
                '}';
    }
}
