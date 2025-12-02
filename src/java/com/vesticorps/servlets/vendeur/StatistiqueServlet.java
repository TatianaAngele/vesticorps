
package com.vesticorps.servlets.vendeur;

import com.vesticorps.beans.Utilisateur;
import com.vesticorps.dao.ClientProduitDAO;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StatistiqueServlet extends HttpServlet {
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
        HashMap<String, String> stat = dao.getStatByVendeur(id_utilisateur);
        
        request.setAttribute("stat", stat);
        this.getServletContext().getRequestDispatcher("/WEB-INF/vendeur/statistique.jsp").forward(request, response);
    }
}
