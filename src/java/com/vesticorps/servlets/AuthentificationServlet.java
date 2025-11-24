/* 
    Servlet permettant de gérer une authentification
*/
package com.vesticorps.servlets;

import com.vesticorps.beans.Utilisateur;
import com.vesticorps.dao.UtilisateurDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthentificationServlet extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/authentification.jsp").forward(request, response);
    }
    
    @Override 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email"); 
        String motDePasse = request.getParameter("mot_de_passe");
        
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO(); 
        Utilisateur utilisateur = utilisateurDAO.connecterUtilisateur(email, motDePasse);
        HttpSession session = request.getSession();
        
        if(utilisateur != null) {
            session.setAttribute("utilisateur", utilisateur);
            
            // Redirection 
            if (utilisateur.getRole_utilisateur().equals("vendeur")) {
                response.sendRedirect("/vesticorps/vendeur/produit");
            } else if (utilisateur.getRole_utilisateur().equals("client")) {
                response.sendRedirect("/vesticorps/client/produit");
            }
        }
        else {
            session.setAttribute("etatAuthentification", "echec");
            response.sendRedirect("/vesticorps/auth");
        }
    }
}
