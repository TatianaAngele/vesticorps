package com.vesticorps.servlets.client;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PanierServlet extends HttpServlet {
    @Override 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Vérif session
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect(request.getContextPath() + "/auth");
            return;
        }

        // Récupérer les produits du panier
        List<Object[]> panier = (List<Object[]>) session.getAttribute("produitPanier");

        // Pour éviter null dans le JSP
        if (panier == null) {
            request.setAttribute("panier", null);
        } else {
            request.setAttribute("panier", panier);
        }

        // Rediriger vers la vue JSP
        request.getRequestDispatcher("/WEB-INF/client/panier.jsp").forward(request, response);
    }
}
