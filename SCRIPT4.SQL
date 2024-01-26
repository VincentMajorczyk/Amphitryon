# -----------------------------------------------------------------------------
#       TABLE : UTILISATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UTILISATEUR
 (
   IDUTILISATEUR INTEGER(3) NOT NULL  AUTO_INCREMENT,
   PRENOM VARCHAR(128) NULL  ,
   NOM VARCHAR(128) NULL  ,
   MDP VARCHAR(128) NULL  ,
   MAIL VARCHAR(128) NULL  ,
   POSTE VARCHAR(40) NULL  
   , PRIMARY KEY (IDUTILISATEUR) 
 ) ENGINE=InnoDB;


# -----------------------------------------------------------------------------
#       TABLE : COMMANDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMANDE
 (
   IDCOMMANDE INTEGER(5) NOT NULL AUTO_INCREMENT,
   DATEE DATE NOT NULL  ,
   IDSERVICE INTEGER(4) NOT NULL,
   NOMTABLE VARCHAR(128) NOT NULL ,
   HEURECOMMANDE TIME NULL ,
   ETATCOMMANDE VARCHAR(40) NULL  
   , PRIMARY KEY (IDCOMMANDE) 
 ) 
ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COMMANDE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COMMANDE_TABLEE
     ON COMMANDE (DATEE ASC,IDSERVICE ASC,NOMTABLE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PLAT
 (
   IDPLAT INTEGER(4) NOT NULL AUTO_INCREMENT ,
   IDCATEGPLAT INTEGER(5) NOT NULL ,
   NOMPLAT VARCHAR(128) NULL  ,
   DESCRIPTIF VARCHAR(128) NULL  
   , PRIMARY KEY (IDPLAT) 
 ) 
ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PLAT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PLAT_CATEGEORIE_PLAT
     ON PLAT (IDCATEGPLAT ASC);

# -----------------------------------------------------------------------------
#       TABLE : TABLEE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TABLEE
 (
   DATEE DATE NOT NULL  ,
   IDSERVICE INTEGER(4) NOT NULL  ,
   NOMTABLE VARCHAR(128) NOT NULL  ,
   IDUTILISATEUR INTEGER(3) NOT NULL ,
   NBPLACE INTEGER(3) NULL  
   , PRIMARY KEY (DATEE,IDSERVICE,NOMTABLE) 
 ) 
ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE TABLEE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_TABLEE_SERVICE
     ON TABLEE (IDSERVICE ASC);

CREATE  INDEX I_FK_TABLEE_DATEE
     ON TABLEE (DATEE ASC);

CREATE  INDEX I_FK_TABLEE_UTILISATEUR
     ON TABLEE (IDUTILISATEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : SERVICE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SERVICE
 (
   IDSERVICE INTEGER(4) NOT NULL AUTO_INCREMENT
   , PRIMARY KEY (IDSERVICE) 
 ) 
ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       TABLE : CATEGEORIE_PLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGEORIE_PLAT
 (
   IDCATEGPLAT INTEGER(5) NOT NULL AUTO_INCREMENT ,
   LIBELLE VARCHAR(128) NULL  
   , PRIMARY KEY (IDCATEGPLAT) 
 ) 
ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       TABLE : DATEE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DATEE
 (
   DATEE DATE NOT NULL  
   , PRIMARY KEY (DATEE) 
 ) 
ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       TABLE : PROPOSERPLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROPOSERPLAT
 (
   IDPLAT INTEGER(4) NOT NULL ,
   IDSERVICE INTEGER(4) NOT NULL ,
   DATEE DATE NOT NULL  ,
   QUANTITEPROPOSEE INTEGER(5) NULL  ,
   PRIXVENTE DECIMAL(10,2) NULL  
   , PRIMARY KEY (IDPLAT,IDSERVICE,DATEE) 
 ) 
ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PROPOSERPLAT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PROPOSERPLAT_PLAT
     ON PROPOSERPLAT (IDPLAT ASC);

CREATE  INDEX I_FK_PROPOSERPLAT_SERVICE
     ON PROPOSERPLAT (IDSERVICE ASC);

CREATE  INDEX I_FK_PROPOSERPLAT_DATEE
     ON PROPOSERPLAT (DATEE ASC);

# -----------------------------------------------------------------------------
#       TABLE : COMPOSE_DE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMPOSE_DE
 (
   IDCOMMANDE INTEGER(5) NOT NULL  ,
   IDPLAT INTEGER(4) NOT NULL  ,
   ETATPLAT VARCHAR(40) NULL  ,
   INFOSUPPLEMENTAIRE VARCHAR(256) NULL  ,
   QUANTITE INTEGER(5) NULL  
   , PRIMARY KEY (IDCOMMANDE,IDPLAT) 
 ) 
ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COMPOSE_DE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COMPOSE_DE_COMMANDE
     ON COMPOSE_DE (IDCOMMANDE ASC);

CREATE  INDEX I_FK_COMPOSE_DE_PLAT
     ON COMPOSE_DE (IDPLAT ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE COMMANDE 
  ADD FOREIGN KEY FK_COMMANDE_TABLEE (DATEE,IDSERVICE,NOMTABLE)
      REFERENCES TABLEE (DATEE,IDSERVICE,NOMTABLE) ;


ALTER TABLE PLAT 
  ADD FOREIGN KEY FK_PLAT_CATEGEORIE_PLAT (IDCATEGPLAT)
      REFERENCES CATEGEORIE_PLAT (IDCATEGPLAT) ;


ALTER TABLE TABLEE 
  ADD FOREIGN KEY FK_TABLEE_SERVICE (IDSERVICE)
      REFERENCES SERVICE (IDSERVICE) ;


ALTER TABLE TABLEE 
  ADD FOREIGN KEY FK_TABLEE_DATEE (DATEE)
      REFERENCES DATEE (DATEE) ;


ALTER TABLE TABLEE 
  ADD FOREIGN KEY FK_TABLEE_UTILISATEUR (IDUTILISATEUR)
      REFERENCES UTILISATEUR (IDUTILISATEUR) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_PLAT (IDPLAT)
      REFERENCES PLAT (IDPLAT) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_SERVICE (IDSERVICE)
      REFERENCES SERVICE (IDSERVICE) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_DATEE (DATEE)
      REFERENCES DATEE (DATEE) ;


ALTER TABLE COMPOSE_DE 
  ADD FOREIGN KEY FK_COMPOSE_DE_COMMANDE (IDCOMMANDE)
      REFERENCES COMMANDE (IDCOMMANDE) ;


ALTER TABLE COMPOSE_DE 
  ADD FOREIGN KEY FK_COMPOSE_DE_PLAT (IDPLAT)
      REFERENCES PLAT (IDPLAT) ;

