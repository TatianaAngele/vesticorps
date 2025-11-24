package com.vesticorps.dao;

import java.sql.*;
import com.vesticorps.beans.Utilisateur;
import com.vesticorps.bdd.BaseDeDonnees; 

public class UtilisateurDAO {

    private Connection connection;

    public UtilisateurDAO() {
        try {
            BaseDeDonnees bdd = new BaseDeDonnees();
            this.connection = bdd.getConnection();
        }
        catch(SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /* ================================
       1. CREER UTILISATEUR
       ================================ */
    public boolean creerUtilisateur(Utilisateur utilisateur) {

        String sqlUser = "INSERT INTO utilisateur "
                + "(nom, prenom, email, mot_de_passe, role_utilisateur, telephone, adresse) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
            PreparedStatement psUser = connection.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
        ) {

            psUser.setString(1, utilisateur.getNom());
            psUser.setString(2, utilisateur.getPrenom());
            psUser.setString(3, utilisateur.getEmail());
            psUser.setString(4, utilisateur.getMot_de_passe());
            psUser.setString(5, utilisateur.getRole_utilisateur());
            psUser.setString(6, utilisateur.getTelephone());
            psUser.setString(7, utilisateur.getAdresse());

            int rows = psUser.executeUpdate();
            if (rows == 0) return false;

            ResultSet rs = psUser.getGeneratedKeys();
            long generatedId = 0;

            if (rs.next()) {
                generatedId = rs.getLong(1);
                utilisateur.setId_utilisateur(generatedId); 
            } else {
                return false;
            }

            /* ===========================================================
               INSERTION SELON LE TYPE DE COMPTE
            =========================================================== */

            if (utilisateur.getRole_utilisateur().equalsIgnoreCase("client")) {
                String sqlClient = "INSERT INTO client (id_utilisateur, point_fidelite) VALUES (?, 0)";

                try (PreparedStatement psClient = connection.prepareStatement(sqlClient)) {
                    psClient.setLong(1, generatedId);
                    return psClient.executeUpdate() > 0;
                }

            } else if (utilisateur.getRole_utilisateur().equalsIgnoreCase("vendeur")) {
                String sqlVendeur = "INSERT INTO vendeur (id_utilisateur, statut_vendeur) VALUES (?, 'actif')";

                try (PreparedStatement psVendeur = connection.prepareStatement(sqlVendeur)) {
                    psVendeur.setLong(1, generatedId);
                    return psVendeur.executeUpdate() > 0;
                }
            }

            // Si rôle invalide
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    /* ================================
       2. MODIFIER UTILISATEUR
       ================================ */
    public boolean modifierUtilisateur(Utilisateur utilisateur) {
        String sql = "UPDATE utilisateur SET "
                + "nom=?, prenom=?, email=?, mot_de_passe=?, "
                + "role_utilisateur=?, telephone=?, adresse=? "
                + "WHERE id_utilisateur=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, utilisateur.getNom());
            ps.setString(2, utilisateur.getPrenom());
            ps.setString(3, utilisateur.getEmail());
            ps.setString(4, utilisateur.getMot_de_passe());
            ps.setString(5, utilisateur.getRole_utilisateur());
            ps.setString(6, utilisateur.getTelephone());
            ps.setString(7, utilisateur.getAdresse());
            ps.setLong(8, utilisateur.getId_utilisateur());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    /* ================================
       3. CONNECTER UTILISATEUR (LOGIN)
       ================================ */
    public Utilisateur connecterUtilisateur(String email, String motDePasse) {
        String sql = "SELECT * FROM utilisateur "
                   + "WHERE email=? AND mot_de_passe=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, motDePasse);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Utilisateur u = new Utilisateur();
                u.setId_utilisateur(rs.getLong("id_utilisateur"));
                u.setNom(rs.getString("nom"));
                u.setPrenom(rs.getString("prenom"));
                u.setEmail(rs.getString("email"));
                u.setMot_de_passe(rs.getString("mot_de_passe"));
                u.setRole_utilisateur(rs.getString("role_utilisateur"));
                u.setTelephone(rs.getString("telephone"));
                u.setAdresse(rs.getString("adresse"));
                return u;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // Connexion échouée
    }


    /* ================================
       4. SUPPRIMER UTILISATEUR
       ================================ */
    public boolean supprimerUtilisateur(long idUtilisateur) {
        String sql = "DELETE FROM utilisateur WHERE id_utilisateur=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, idUtilisateur);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
