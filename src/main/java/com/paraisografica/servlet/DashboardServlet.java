package com.paraisografica.servlet;

import com.paraisografica.dao.MaterialDAO;
import com.paraisografica.model.Material;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet para o dashboard principal
 */
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private MaterialDAO materialDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        materialDAO = new MaterialDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Verificar se o usuário está logado
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("login");
            return;
        }

        try {
            // Buscar estatísticas dos materiais
            List<Material> todosMateriais = materialDAO.listarTodos();
            List<String> categorias = materialDAO.listarCategorias();
            
            // Calcular estatísticas
            int totalMateriais = todosMateriais.size();
            int totalCategorias = categorias.size();
            int totalQuantidade = todosMateriais.stream().mapToInt(Material::getQuantidade).sum();
            double valorTotal = todosMateriais.stream().mapToDouble(Material::getValorTotal).sum();
            
            // Materiais com estoque baixo (quantidade < 10)
            long materiaisEstoqueBaixo = todosMateriais.stream()
                .filter(m -> m.getQuantidade() < 10)
                .count();
            
            // Adicionar dados ao request
            request.setAttribute("totalMateriais", totalMateriais);
            request.setAttribute("totalCategorias", totalCategorias);
            request.setAttribute("totalQuantidade", totalQuantidade);
            request.setAttribute("valorTotal", valorTotal);
            request.setAttribute("materiaisEstoqueBaixo", materiaisEstoqueBaixo);
            request.setAttribute("categorias", categorias);
            request.setAttribute("materiais", todosMateriais);
            
            // Redirecionar para o dashboard
            request.getRequestDispatcher("/WEB-INF/views/dashboard-simples.jsp").forward(request, response);
            
        } catch (SQLException e) {
            request.setAttribute("erro", "Erro ao carregar dados do dashboard: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
        }
    }
}
