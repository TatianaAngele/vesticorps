package com.vesticorps.beans;

public class ClientProduit {
    private long id_utilisateur; 
    private long id_produit; 
    private long date_commande; 
    private long quantite_commande; 
    
    public ClientProduit() {} 

    public long getId_utilisateur() {
        return id_utilisateur;
    }

    public void setId_utilisateur(long id_utilisateur) {
        this.id_utilisateur = id_utilisateur;
    }

    public long getId_produit() {
        return id_produit;
    }

    public void setId_produit(long id_produit) {
        this.id_produit = id_produit;
    }

    public long getDate_commande() {
        return date_commande;
    }

    public void setDate_commande(long date_commande) {
        this.date_commande = date_commande;
    }

    public long getQuantite_commande() {
        return quantite_commande;
    }

    public void setQuantite_commande(long quantite_commande) {
        this.quantite_commande = quantite_commande;
    }
}
