CREATE TABLE utilisateur (
    id_utilisateur BIGINT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    role_utilisateur VARCHAR(20) NOT NULL,
    telephone CHAR(10) NOT NULL UNIQUE,
    adresse VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_utilisateur)
) ENGINE=InnoDB;

CREATE TABLE vendeur (
    id_utilisateur BIGINT NOT NULL,
    statut_vendeur VARCHAR(9) NOT NULL,
    FOREIGN KEY (id_utilisateur) 
        REFERENCES utilisateur(id_utilisateur)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE client (
    id_utilisateur BIGINT NOT NULL,
    point_fidelite INT NOT NULL,
    FOREIGN KEY (id_utilisateur) 
        REFERENCES utilisateur(id_utilisateur)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE produit (
    id_produit BIGINT NOT NULL AUTO_INCREMENT, 
    id_utilisateur BIGINT NOT NULL, /* UML OCL : si role_utilisateur = 'vendeur' */
    nom_produit VARCHAR(50) NOT NULL, 
    photo TEXT NOT NULL, 
    description TEXT NOT NULL, 
    prix_unitaire INT NOT NULL, 
    quantite_stock INT NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    PRIMARY KEY(id_produit)
) ENGINE=InnoDB;

/* Table d'association */
CREATE TABLE client_produit (
    id_utilisateur BIGINT NOT NULL,
    id_produit BIGINT NOT NULL,
    date_commande DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    quantite_commande INT NOT NULL,
    FOREIGN KEY (id_utilisateur) 
        REFERENCES utilisateur(id_utilisateur)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_produit) 
        REFERENCES produit(id_produit)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE commentaire (
    id_commentaire BIGINT NOT NULL AUTO_INCREMENT,
    id_utilisateur BIGINT NOT NULL, 
    id_produit BIGINT NOT NULL, 
    commentaire TEXT NOT NULL,
    date_commentaire  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_utilisateur) 
        REFERENCES utilisateur(id_utilisateur)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_produit) 
        REFERENCES produit(id_produit)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 
    PRIMARY KEY (id_commentaire)
) ENGINE=InnoDB;