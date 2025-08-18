package com.magazineluiza.estoque.servlet;

import com.magazineluiza.estoque.model.Produto;
import com.magazineluiza.estoque.repository.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "ProdutoServlet", urlPatterns = "/produtos/*")
public class ProdutoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || "/".equals(path)) {
            req.setAttribute("produtos", Database.listarProdutos());
            req.setAttribute("categorias", Database.listarCategorias());
            req.getRequestDispatcher("/WEB-INF/views/produtos/list.jsp").forward(req, resp);
            return;
        }

        if ("/novo".equals(path)) {
            req.setAttribute("categorias", Database.listarCategorias());
            req.getRequestDispatcher("/WEB-INF/views/produtos/form.jsp").forward(req, resp);
            return;
        }

        if (path.startsWith("/editar/")) {
            int id = Integer.parseInt(path.substring("/editar/".length()));
            Database.obterProduto(id).ifPresent(p -> req.setAttribute("produto", p));
            req.setAttribute("categorias", Database.listarCategorias());
            req.getRequestDispatcher("/WEB-INF/views/produtos/form.jsp").forward(req, resp);
            return;
        }

        if (path.startsWith("/remover/")) {
            int id = Integer.parseInt(path.substring("/remover/".length()));
            Database.removerProduto(id);
            resp.sendRedirect(req.getContextPath() + "/produtos");
            return;
        }

        resp.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        String nome = req.getParameter("nome");
        String categoriaIdStr = req.getParameter("categoriaId");
        String precoStr = req.getParameter("preco");
        String quantidadeStr = req.getParameter("quantidade");

        Integer categoriaId = Integer.parseInt(categoriaIdStr);
        BigDecimal preco = new BigDecimal(precoStr.replace(",", "."));
        Integer quantidade = Integer.parseInt(quantidadeStr);

        if (idStr == null || idStr.isBlank()) {
            Database.addProduto(new Produto(null, nome, categoriaId, preco, quantidade));
        } else {
            int id = Integer.parseInt(idStr);
            Database.atualizarProduto(new Produto(id, nome, categoriaId, preco, quantidade));
        }

        resp.sendRedirect(req.getContextPath() + "/produtos");
    }
}


