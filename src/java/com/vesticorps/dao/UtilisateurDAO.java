package com.vesticorps.dao;

import java.sql.*;
import com.vesticorps.beans.Utilisateur;

public class UtilisateurDAO {

    private Connection connection;

    public UtilisateurDAO(Connection connection) {
        this.connection = connection;
    }

    /* ================================
       1. CREER UTILISATEUR
       ================================ */
    public boolean creerUtilisateur(Utilisateur utilisateur) {
        String sql = "INSERT INTO utilisateur "
                + "(nom, prenom, email, mot_de_passe, role_utilisateur, telephone, adresse) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, utilisateur.getNom());
            ps.setString(2, utilisateur.getPrenom());
            ps.setString(3, utilisateur.getEmail());
            ps.setString(4, utilisateur.getMot_de_passe());
            ps.setString(5, utilisateur.getRole_utilisateur());
            ps.setString(6, utilisateur.getTelephone());
            ps.setString(7, utilisateur.getAdresse());

            return ps.executeUpdate() > 0;

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
