package com.vesticorps.dao;

import com.vesticorps.bdd.BaseDeDonnees;
import com.vesticorps.beans.ClientProduit;
import com.vesticorps.beans.Produit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClientProduitDAO {

    private Connection connection;

    private static final String SQL_INSERT =
        "INSERT INTO client_produit (id_utilisateur, id_produit, date_commande, quantite_commande) " +
        "VALUES (?, ?, NOW(), ?)";

    private static final String SQL_CHECK_STOCK =
        "SELECT quantite_stock FROM produit WHERE id_produit = ? FOR UPDATE";

    private static final String SQL_UPDATE_STOCK =
        "UPDATE produit SET quantite_stock = quantite_stock - ? WHERE id_produit = ?";

    public ClientProduitDAO() {
        try {
            BaseDeDonnees bdd = new BaseDeDonnees();
            this.connection = bdd.getConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * Insérer une commande simple (non utilisé dans le panier mais conservé pour cohérence)
     */
    public void insererCommande(ClientProduit cp) throws SQLException {
        PreparedStatement ps = null;

        try {
            ps = connection.prepareStatement(SQL_INSERT);

            ps.setLong(1, cp.getId_utilisateur());
            ps.setLong(2, cp.getId_produit());
            ps.setLong(3, cp.getQuantite_commande());

            ps.executeUpdate();

        } finally {
            if (ps != null) ps.close();
        }
    }

    /**
     * Insère plusieurs commandes (panier complet) avec mise à jour des stocks
     */
    public boolean insererCommandeMultiple(List<ClientProduit> commandes) throws SQLException {
        if (commandes == null || commandes.isEmpty()) return false;

        PreparedStatement psInsert = null;
        PreparedStatement psStockCheck = null;
        PreparedStatement psUpdateStock = null;

        try {
            connection.setAutoCommit(false); // début transaction

            psInsert = connection.prepareStatement(SQL_INSERT);
            psStockCheck = connection.prepareStatement(SQL_CHECK_STOCK);
            psUpdateStock = connection.prepareStatement(SQL_UPDATE_STOCK);

            for (ClientProduit cp : commandes) {

                
                psStockCheck.setLong(1, cp.getId_produit());
                ResultSet rs = psStockCheck.executeQuery();

                if (!rs.next()) {
                    connection.rollback();
                    return false; // Produit inexistant
                }

                int stockDisponible = rs.getInt("quantite_stock");

                if (stockDisponible < cp.getQuantite_commande()) {
                    connection.rollback();
                    return false; // Pas assez de stock
                }

               
                psInsert.setLong(1, cp.getId_utilisateur());
                psInsert.setLong(2, cp.getId_produit());
                psInsert.setLong(3, cp.getQuantite_commande());
                psInsert.executeUpdate();

                
                psUpdateStock.setInt(1, (int) cp.getQuantite_commande());
                psUpdateStock.setLong(2, cp.getId_produit());
                psUpdateStock.executeUpdate();
            }

            connection.commit(); // validation
            return true;

        } catch (SQLException e) {
            connection.rollback();
            throw e;

        } finally {
            connection.setAutoCommit(true);
            if (psInsert != null) psInsert.close();
            if (psStockCheck != null) psStockCheck.close();
            if (psUpdateStock != null) psUpdateStock.close();
        }
    }
    
    /* 
        Récuperer tous les commandes d'un client
    */
    public List<ClientProduit> getCommandesByClient(long idClient) throws SQLException {
        final String SQL_SELECT_BY_CLIENT =
            "SELECT cp.id_produit, cp.date_commande, cp.quantite_commande, "
          + "p.nom_produit, p.prix_unitaire, p.photo "
          + "FROM client_produit cp "
          + "JOIN produit p ON cp.id_produit = p.id_produit "
          + "WHERE cp.id_utilisateur = ? "
          + "ORDER BY cp.date_commande DESC";
        
        List<ClientProduit> commandes = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = connection.prepareStatement(SQL_SELECT_BY_CLIENT);
            ps.setInt(1, (int) idClient);
            rs = ps.executeQuery();

            while (rs.next()) {

                ClientProduit cp = new ClientProduit();
                cp.setId_utilisateur((int) idClient);
                cp.setId_produit(rs.getInt("id_produit"));
                cp.setDate_commande(rs.getString("date_commande"));
                cp.setQuantite_commande(rs.getInt("quantite_commande"));

                // Création de l'objet Produit
                Produit p = new Produit();
                p.setId_produit(rs.getInt("id_produit"));
                p.setNom_produit(rs.getString("nom_produit"));
                p.setPrix_unitaire(rs.getInt("prix_unitaire"));
                p.setPhoto(rs.getString("photo"));

                cp.setProduit(p); 

                commandes.add(cp);
            }

        } catch (SQLException e) {
            throw e;
        }

        return commandes;
    }
}
