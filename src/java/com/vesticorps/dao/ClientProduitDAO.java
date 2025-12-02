package com.vesticorps.dao;

import com.vesticorps.bdd.BaseDeDonnees;
import com.vesticorps.beans.ClientProduit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
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
}
