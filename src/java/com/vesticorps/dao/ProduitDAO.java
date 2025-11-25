package com.vesticorps.dao;

import com.vesticorps.bdd.BaseDeDonnees;
import com.vesticorps.beans.Produit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProduitDAO {

    private Connection connection;

    public ProduitDAO() {
        try {
            BaseDeDonnees bdd = new BaseDeDonnees();
            this.connection = bdd.getConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * Insère un produit pour un vendeur donné
     */
    public boolean creerProduit(Produit produit) {

        String sql = "INSERT INTO produit (id_utilisateur, nom_produit, photo, description, prix_unitaire, quantite_stock) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, (int) produit.getId_utilisateur());
            ps.setString(2, produit.getNom_produit());
            ps.setString(3, produit.getPhoto());
            ps.setString(4, produit.getDescription());
            ps.setInt(5, produit.getPrix_unitaire());
            ps.setInt(6, produit.getQuantite_stock());

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
