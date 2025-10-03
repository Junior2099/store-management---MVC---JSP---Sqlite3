package com.magazineluiza.estoque.config;

import com.magazineluiza.estoque.repository.SQLite;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppBootstrapListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Garante criação das tabelas antes de qualquer servlet, sem derrubar o contexto em caso de erro
        try {
            SQLite.initialize();
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // nada a fazer
    }
}


