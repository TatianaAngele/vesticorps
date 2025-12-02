package com.vesticorps.servlets.vendeur;

import com.vesticorps.beans.ClientProduit;
import com.vesticorps.beans.Utilisateur;
import com.vesticorps.dao.ClientProduitDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CommandesVendeurServlet extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session = request.getSession(false);

        // Vérification session vendeur
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        long idVendeur = utilisateur.getId_utilisateur();

        ClientProduitDAO dao = new ClientProduitDAO();

        List<ClientProduit> commandes = dao.getCommandesByVendeur(idVendeur);

        request.setAttribute("commandes", commandes);
        this.getServletContext().getRequestDispatcher("/WEB-INF/vendeur/commandes.jsp").forward(request, response);
    }
}
