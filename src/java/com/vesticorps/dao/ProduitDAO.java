package com.vesticorps.dao;

import com.vesticorps.bdd.BaseDeDonnees;
import com.vesticorps.beans.Produit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet; 
import java.util.ArrayList;
import java.util.List;

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
    
     /**
     * Récupère la liste des produits appartenant à un vendeur
     */
    public List<Produit> getProduitsByVendeur(int idUtilisateur) {

        List<Produit> liste = new ArrayList<>();

        try {
            String sql = "SELECT * FROM produit WHERE id_utilisateur = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idUtilisateur);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Produit p = new Produit();

                p.setId_produit(rs.getInt("id_produit"));
                p.setNom_produit(rs.getString("nom_produit"));
                p.setPhoto(rs.getString("photo"));
                p.setDescription(rs.getString("description"));
                p.setPrix_unitaire(rs.getInt("prix_unitaire"));
                p.setQuantite_stock(rs.getInt("quantite_stock"));
                p.setId_utilisateur(rs.getInt("id_utilisateur"));

                liste.add(p);
            }

            rs.close();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return liste;
    }
}
