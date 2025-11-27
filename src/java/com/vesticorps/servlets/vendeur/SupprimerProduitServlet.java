package com.vesticorps.servlets.vendeur;

import com.vesticorps.dao.ProduitDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SupprimerProduitServlet extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
                
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect("/vesticorps/auth");
            return;
        }
        
        ProduitDAO produitDAO = new ProduitDAO(); 
        produitDAO.deleteProduit(Integer.parseInt(request.getParameter("id_produit")));
        response.sendRedirect(request.getContextPath() + "/vendeur/produit");
    }
}
