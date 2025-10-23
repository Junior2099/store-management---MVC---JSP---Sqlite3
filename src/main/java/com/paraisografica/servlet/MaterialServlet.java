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
 * Servlet para gerenciamento de materiais (CRUD)
 */
@WebServlet("/materiais")
public class MaterialServlet extends HttpServlet {

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

        String action = request.getParameter("action");
        
        try {
            if (action == null || action.equals("list")) {
                // Listar todos os materiais
                List<Material> materiais = materialDAO.listarTodos();
                request.setAttribute("materiais", materiais);
                request.getRequestDispatcher("/WEB-INF/views/materiais.jsp").forward(request, response);
                
            } else if (action.equals("form")) {
                // Exibir formulário para novo material
                request.getRequestDispatcher("/WEB-INF/views/material-form.jsp").forward(request, response);
                
            } else if (action.equals("edit")) {
                // Exibir formulário para editar material
                String idStr = request.getParameter("id");
                if (idStr != null && !idStr.trim().isEmpty()) {
                    int id = Integer.parseInt(idStr);
                    Material material = materialDAO.buscarPorId(id);
                    if (material != null) {
                        request.setAttribute("material", material);
                        request.getRequestDispatcher("/WEB-INF/views/material-form.jsp").forward(request, response);
                    } else {
                        request.setAttribute("erro", "Material não encontrado");
                        response.sendRedirect("materiais");
                    }
                } else {
                    response.sendRedirect("materiais");
                }
                
            } else if (action.equals("delete")) {
                // Excluir material
                String idStr = request.getParameter("id");
                if (idStr != null && !idStr.trim().isEmpty()) {
                    int id = Integer.parseInt(idStr);
                    boolean sucesso = materialDAO.remover(id);
                    if (sucesso) {
                        request.setAttribute("sucesso", "Material removido com sucesso!");
                    } else {
                        request.setAttribute("erro", "Erro ao remover material");
                    }
                }
                response.sendRedirect("materiais");
            }
            
        } catch (SQLException | NumberFormatException e) {
            request.setAttribute("erro", "Erro ao processar solicitação: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Verificar se o usuário está logado
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        
        try {
            if (action.equals("save")) {
                // Salvar material (novo ou edição)
                String idStr = request.getParameter("id");
                Material material = new Material();
                
                if (idStr != null && !idStr.trim().isEmpty()) {
                    material.setId(Integer.parseInt(idStr));
                }
                
                // Validar campos obrigatórios
                String nome = request.getParameter("nome");
                String categoria = request.getParameter("categoria");
                String quantidadeStr = request.getParameter("quantidade");
                String precoStr = request.getParameter("precoUnitario");
                
                if (nome == null || nome.trim().isEmpty()) {
                    request.setAttribute("erro", "Nome é obrigatório");
                    request.getRequestDispatcher("/WEB-INF/views/material-form.jsp").forward(request, response);
                    return;
                }
                
                if (categoria == null || categoria.trim().isEmpty()) {
                    request.setAttribute("erro", "Categoria é obrigatória");
                    request.getRequestDispatcher("/WEB-INF/views/material-form.jsp").forward(request, response);
                    return;
                }
                
                material.setNome(nome.trim());
                material.setDescricao(request.getParameter("descricao"));
                material.setCategoria(categoria.trim());
                
                try {
                    material.setQuantidade(Integer.parseInt(quantidadeStr));
                    material.setPrecoUnitario(Double.parseDouble(precoStr));
                } catch (NumberFormatException e) {
                    request.setAttribute("erro", "Quantidade e preço devem ser números válidos");
                    request.getRequestDispatcher("/WEB-INF/views/material-form.jsp").forward(request, response);
                    return;
                }
                
                material.setFornecedor(request.getParameter("fornecedor"));
                
                boolean sucesso;
                if (material.getId() > 0) {
                    sucesso = materialDAO.atualizar(material);
                    if (sucesso) {
                        request.setAttribute("sucesso", "Material atualizado com sucesso!");
                    } else {
                        request.setAttribute("erro", "Erro ao atualizar material");
                    }
                } else {
                    sucesso = materialDAO.inserir(material);
                    if (sucesso) {
                        request.setAttribute("sucesso", "Material cadastrado com sucesso!");
                    } else {
                        request.setAttribute("erro", "Erro ao cadastrar material");
                    }
                }
                
                response.sendRedirect("materiais");
            }
            
        } catch (SQLException e) {
            e.printStackTrace(); // Log do erro para debug
            request.setAttribute("erro", "Erro no banco de dados: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Log do erro para debug
            request.setAttribute("erro", "Erro inesperado: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
        }
    }
}
