package com.vesticorps.servlets;

import com.vesticorps.beans.Utilisateur;
import com.vesticorps.dao.UtilisateurDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreerCompteServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/creer_compte.jsp").forward(request, response);
    }  
    
    @Override 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Récupération des données 
        Utilisateur utilisateur = new Utilisateur(); 
        utilisateur.setNom(request.getParameter("nom"));
        utilisateur.setPrenom(request.getParameter("prenom"));
        utilisateur.setEmail(request.getParameter("email"));
        utilisateur.setMot_de_passe(request.getParameter("mot_de_passe"));
        utilisateur.setTelephone(request.getParameter("telephone"));
        utilisateur.setAdresse(request.getParameter("adresse"));
        utilisateur.setRole_utilisateur(request.getParameter("role_utilisateur"));
        
        // Insertion des données dans la base de données
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO(); 
        if(utilisateurDAO.creerUtilisateur(utilisateur)) {
            System.out.println("Utilisateur crée avec succès"); 
        }
        else {
            System.out.println("Erreur de création de l'utilisateur"); 
        }
        
        // Redirection 
    }
}
