package com.vesticorps.servlets.client;

import com.vesticorps.beans.ClientProduit;
import com.vesticorps.beans.Produit;
import com.vesticorps.beans.Utilisateur;
import com.vesticorps.dao.ClientProduitDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValiderCommandeServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect(request.getContextPath() + "/auth");
            return;
        }

        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        long idClient = utilisateur.getId_utilisateur();

        // Récupérer le panier
        List<Object[]> panier = (List<Object[]>) session.getAttribute("produitPanier");

        if (panier == null || panier.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/client/panier");
            return;
        }

        // Liste des commandes à insérer
        List<ClientProduit> commandes = new ArrayList<>();

        for (Object[] item : panier) {
            Produit produit = (Produit) item[0];
            int quantite = (int) item[1];

            ClientProduit cp = new ClientProduit();
            cp.setId_utilisateur(idClient);
            cp.setId_produit(produit.getId_produit());
            cp.setQuantite_commande(quantite);

            commandes.add(cp);
        }

        // DAO insertion
        ClientProduitDAO dao = new ClientProduitDAO();

        try {
            dao.insererCommandeMultiple(commandes);
        } catch (SQLException e) {
            throw new ServletException("Erreur lors de la validation de commande", e);
        }

        // Vider panier
        session.setAttribute("produitPanier", new ArrayList<>());

        // Redirection vers confirmation
        response.sendRedirect(request.getContextPath() + "/client/commandes?success=1");
    }
}
