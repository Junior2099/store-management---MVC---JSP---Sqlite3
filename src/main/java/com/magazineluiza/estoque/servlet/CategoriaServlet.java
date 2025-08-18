package com.magazineluiza.estoque.servlet;

import com.magazineluiza.estoque.model.Categoria;
import com.magazineluiza.estoque.repository.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CategoriaServlet", urlPatterns = "/categorias/*")
public class CategoriaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || "/".equals(path)) {
            req.setAttribute("categorias", Database.listarCategorias());
            req.getRequestDispatcher("/WEB-INF/views/categorias/list.jsp").forward(req, resp);
            return;
        }

        if ("/novo".equals(path)) {
            req.getRequestDispatcher("/WEB-INF/views/categorias/form.jsp").forward(req, resp);
            return;
        }

        if (path.startsWith("/editar/")) {
            int id = Integer.parseInt(path.substring("/editar/".length()));
            Database.obterCategoria(id).ifPresent(c -> req.setAttribute("categoria", c));
            req.getRequestDispatcher("/WEB-INF/views/categorias/form.jsp").forward(req, resp);
            return;
        }

        if (path.startsWith("/remover/")) {
            int id = Integer.parseInt(path.substring("/remover/".length()));
            Database.removerCategoria(id);
            resp.sendRedirect(req.getContextPath() + "/categorias");
            return;
        }

        resp.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        String nome = req.getParameter("nome");

        if (idStr == null || idStr.isBlank()) {
            Database.addCategoria(new Categoria(null, nome));
        } else {
            int id = Integer.parseInt(idStr);
            Database.atualizarCategoria(new Categoria(id, nome));
        }
        resp.sendRedirect(req.getContextPath() + "/categorias");
    }
}


