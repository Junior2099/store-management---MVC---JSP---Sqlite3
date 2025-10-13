package com.magazineluiza.estoque.servlet;

import com.magazineluiza.estoque.model.MovimentoEstoque;
import com.magazineluiza.estoque.repository.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "MovimentoServlet", urlPatterns = "/movimentos/*")
public class MovimentoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || "/".equals(path)) {
            req.setAttribute("movimentos", Database.listarMovimentos());
            req.setAttribute("produtos", Database.listarProdutos());
            req.getRequestDispatcher("/WEB-INF/views/movimentos/list.jsp").forward(req, resp);
            return;
        }

        if ("/novo".equals(path)) {
            req.setAttribute("produtos", Database.listarProdutos());
            req.getRequestDispatcher("/WEB-INF/views/movimentos/form.jsp").forward(req, resp);
            return;
        }

        resp.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String produtoIdStr = req.getParameter("produtoId");
        String quantidadeStr = req.getParameter("quantidade");
        String tipo = req.getParameter("tipo");
        String observacao = req.getParameter("observacao");

        int produtoId = Integer.parseInt(produtoIdStr);
        int quantidade = Integer.parseInt(quantidadeStr);
        MovimentoEstoque.Tipo tipoEnum = "ENTRADA".equalsIgnoreCase(tipo) ? MovimentoEstoque.Tipo.ENTRADA : MovimentoEstoque.Tipo.SAIDA;

        Database.addMovimento(new MovimentoEstoque(null, produtoId, quantidade, tipoEnum, LocalDateTime.now(), observacao));
        resp.sendRedirect(req.getContextPath() + "/movimentos");
    }
}


