package com.vesticorps.servlets.client;

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

public class CommandesServlet extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect(request.getContextPath() + "/auth");
            return;
        }

        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur"); 
         long id_utilisateur = utilisateur.getId_utilisateur();

        
        ClientProduitDAO dao = new ClientProduitDAO();

        try {
            
            List<ClientProduit> commandes = dao.getCommandesByClient(id_utilisateur);

            
            request.setAttribute("commandes", commandes);
            request.getRequestDispatcher("/WEB-INF/client/commandes.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500);
        }
    }
}
