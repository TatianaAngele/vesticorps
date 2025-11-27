package com.vesticorps.servlets.vendeur;

import com.vesticorps.beans.Produit;
import com.vesticorps.beans.Utilisateur;
import com.vesticorps.dao.ProduitDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ModifierProduitServlet extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
                
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect("/vesticorps/auth");
            return;
        }
        
        // Récupération du produit a modifier : 
        ProduitDAO produitDAO = new ProduitDAO(); 
        Produit produit = produitDAO.getProduitById(Integer.parseInt(request.getParameter("id_produit")));
        
        request.setAttribute("produit", produit);
        this.getServletContext().getRequestDispatcher("/WEB-INF/vendeur/modifierProduit.jsp").forward(request, response);
    }
    
    @Override 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
                
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect("/vesticorps/auth");
            return;
        }
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        
        Produit produit = new Produit();
        produit.setId_utilisateur(utilisateur.getId_utilisateur());
               
        produit.setId_produit(Integer.parseInt(request.getParameter("id_produit")));
        produit.setNom_produit(request.getParameter("nom_produit"));
        produit.setDescription(request.getParameter("description"));
        produit.setPrix_unitaire(Integer.parseInt(request.getParameter("prix_unitaire")));
        produit.setQuantite_stock(Integer.parseInt(request.getParameter("quantite_stock")));
        
        ProduitDAO produitDAO = new ProduitDAO(); 
        produitDAO.updateProduit(produit);
            
        response.sendRedirect(request.getContextPath() + "/vendeur/produit");
    }

}
