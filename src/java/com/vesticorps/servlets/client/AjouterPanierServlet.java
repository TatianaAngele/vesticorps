package com.vesticorps.servlets.client;

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

public class AjouterPanierServlet extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Vérif session
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect(request.getContextPath() + "/auth");
            return;
        }

        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        // Récupérer l'id du produit
        int id_produit = Integer.parseInt(request.getParameter("id_produit"));

        // Charger le produit depuis la BD
        ProduitDAO produitDAO = new ProduitDAO(); 
        Produit produit = produitDAO.getProduitById(id_produit);
        if (produit == null) {
            response.sendRedirect(request.getContextPath() + "/client/produits");
            return;
        }

        // Récupérer ou créer la liste du panier
        List<Object[]> panier = (List<Object[]>) session.getAttribute("produitPanier");

        if (panier == null) {
            panier = new ArrayList<>();
        }

        boolean existeDeja = false;

        // Vérifier si produit déjà présent
        for (Object[] item : panier) {
            Produit p = (Produit) item[0];
            int quantite = (int) item[1];

            if (p.getId_produit() == produit.getId_produit()) {
                // Le produit existe déjà → augmenter quantité
                item[1] = quantite + 1;
                existeDeja = true;
                break;
            }
        }

        // Si le produit n'était pas encore dans le panier
        if (!existeDeja) {
            panier.add(new Object[]{produit, 1});
        }

        // Mise à jour de la session
        session.setAttribute("produitPanier", panier);
        
        
        // Redirection vers la page panier
        response.sendRedirect(request.getContextPath() + "/client/panier");
    }
}
