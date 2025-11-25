package com.vesticorps.servlets.vendeur;

import com.vesticorps.beans.Produit;
import com.vesticorps.beans.Utilisateur;
import com.vesticorps.dao.ProduitDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProduitServletVendeur extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
                
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect("/vesticorps/auth");
            return;
        }
        
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur"); 
        ProduitDAO produitDAO = new ProduitDAO(); 
        List<Produit> produits = produitDAO.getProduitsByVendeur( (int) utilisateur.getId_utilisateur());
        request.setAttribute("produits", produits);
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/vendeur/produit.jsp").forward(request, response);
    }
    
}
