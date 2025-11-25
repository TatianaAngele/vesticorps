package com.vesticorps.servlets.vendeur;

import com.vesticorps.beans.Produit;
import com.vesticorps.beans.Utilisateur;
import com.vesticorps.dao.ProduitDAO;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,   // 1MB dans la mémoire
    maxFileSize = 10 * 1024 * 1024,    // 10MB fichier max
    maxRequestSize = 20 * 1024 * 1024  // 20MB requête max
)
public class AjouterProduit extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
                
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect("/vesticorps/auth");
            return;
        }
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/vendeur/ajouterProduit.jsp").forward(request, response);
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect(request.getContextPath() + "/auth");
            return;
        }

        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        // Vérifier multipart
        if (!request.getContentType().startsWith("multipart/")) {
            throw new ServletException("Formulaire incorrect (multipart manquant)");
        }

        // Champ fichier
        Part partPhoto = request.getPart("photo");

        // Récupération du nom du fichier
        String fileName = getFileName(partPhoto);
        if (fileName == null || fileName.trim().isEmpty()) {
            fileName = "default.png";
        }

        // Dossier d’upload local
        String uploadPath = getServletContext().getRealPath("/uploads");

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Enregistrement du fichier
        String filePath = uploadPath + File.separator + fileName;
        partPhoto.write(filePath);
        
        Produit produit = new Produit(); 
        produit.setId_utilisateur(utilisateur.getId_utilisateur());
        produit.setNom_produit(request.getParameter("nom_produit"));
        produit.setDescription(request.getParameter("description"));
        produit.setPrix_unitaire(Integer.parseInt(request.getParameter("prix_unitaire")));
        produit.setQuantite_stock(Integer.parseInt(request.getParameter("quantite_stock")));
        produit.setPhoto(filePath);

        // Enregistrer en BDD
        ProduitDAO produitDAO = new ProduitDAO();
        produitDAO.creerProduit(produit);

        // Redirection vers la liste des produits
        response.sendRedirect(request.getContextPath() + "/vendeur/produit");
    }

    /**
     * Permet de récupérer uniquement le nom du fichier envoyé
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");

        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                // Récupère juste le nom
                return token.substring(token.indexOf('=') + 2, token.length() - 1)
                        .replace("\\", "/")
                        .replaceAll(".*\\/", "");
            }
        }
        return null;
    }
}
