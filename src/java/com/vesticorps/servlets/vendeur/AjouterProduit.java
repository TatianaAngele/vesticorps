package com.vesticorps.servlets.vendeur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AjouterProduit extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
                
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect("/vesticorps/auth");
            return;
        }
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/vendeur/ajouterProduit.jsp").forward(request, response);
    }
}
