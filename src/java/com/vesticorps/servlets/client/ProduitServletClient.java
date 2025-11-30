package com.vesticorps.servlets.client;

import com.vesticorps.beans.Produit;
import com.vesticorps.dao.ProduitDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProduitServletClient extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
                
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect("/vesticorps/auth");
            return;
        }
        
        List<Produit> produits = new ArrayList<Produit>(); 
        ProduitDAO produitDAO = new ProduitDAO(); 
        produits = produitDAO.getAllProduits();
        
        request.setAttribute("produits", produits);
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/client/produit.jsp").forward(request, response);
    } 
}
