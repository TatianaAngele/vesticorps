package com.vesticorps.servlets.client;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SupprimerDuPanierServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect(request.getContextPath() + "/auth");
            return;
        }

        int id_produit = Integer.parseInt(request.getParameter("id_produit"));

        // Récupérer le panier
        List<Object[]> panier = (List<Object[]>) session.getAttribute("produitPanier");

        if (panier != null) {

            // Recherche du produit dans le panier
            for (int i = 0; i < panier.size(); i++) {
                Object[] item = panier.get(i);
                Object produitObj = item[0];

                if (produitObj instanceof com.vesticorps.beans.Produit) {
                    com.vesticorps.beans.Produit p = (com.vesticorps.beans.Produit) produitObj;

                    if (p.getId_produit() == id_produit) {
                        // Supprimer l'item
                        panier.remove(i);
                        break;
                    }
                }
            }

            // Mise à jour de la session
            session.setAttribute("produitPanier", panier);
        }

        // Retour à la page du panier
        response.sendRedirect(request.getContextPath() + "/client/panier");
    }
}
