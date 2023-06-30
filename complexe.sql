-------------------------------------------------------------------------------------
-----------CREATION DE LA BDD AVEC VERIFICATION DE LA NON CREATION------------------- 
-----------ANTERIEUR DU NOM ET SPECIFICATION DU JEU DE CARACTERES--------------------

CREATE DATABASE IF NOT EXISTS Complexes CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

--------------------------------------------------------------------------------------
------------ CREATION DES TABLES AVEC MOTEUR DE STOCKAGE SECURISE --------------------
--------------------------------------------------------------------------------------

CREATE TABLE Cinema(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Nom varchar(50) NOT NULL,
    Adresse varchar(80) NOT NULL, 
    Code_postal varchar(5) NOT NULL, 
    Nb_salles INT(3) NOT NULL
)engine=INNODB;

CREATE TABLE Salle(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nom varchar(80) NOT NULL,
    Nb_places INT(3), 
    Cinema_id INT(11),
    FOREIGN KEY (Cinema_id) REFERENCES Cinema(id)
)engine=INNODB;

CREATE TABLE Film(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Titre varchar(100) NOT NULL,
    Duree INT(3)NOT NULL,
    language_id INT(11), 
    FOREIGN KEY (language_id) REFERENCES Language(id)
)engine=INNODB;

CREATE TABLE Language(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Langue varchar(50) NOT NULL
)engine=INNODB;

CREATE TABLE Seance(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_Heure DATETIME NOT NULL,
    Places_restantes INT(4) NOT NULL, 
    film_id INT(11),
    Cinema_id INT(11),
    Salle_id INT(11),
    FOREIGN KEY (film_id) REFERENCES Film(id), 
    FOREIGN KEY (Cinema_id) REFERENCES Cinema(id), 
    FOREIGN KEY (Salle_id) REFERENCES Salle(id)
)engine=INNODB;

CREATE TABLE Client(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Email varchar(50) NOT NULL,
    Password varchar(50) NOT NULL
)engine=INNODB;

CREATE TABLE Ticket (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nom_tarif varchar(50) NOT NULL,
    tarif FLOAT(6) NOT NULL, 
    client_id INT(11), 
    seance_id INT(11),
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (seance_id) REFERENCES Seance(id)
)engine=INNODB;

CREATE TABLE Administrateur(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Email varchar(50) NOT NULL,
    Password varchar(50) NOT NULL,
    Droit TINYINT(1),
    Cinema_id INT(11),
    FOREIGN KEY (Cinema_id) REFERENCES Cinema(id)
)engine=INNODB

--------------------------------------------------------------------------------------
-----------------------MISE EN PLACE DE DONNEES FACTICES------------------------------
--------------------------------------------------------------------------------------

INSERT INTO Cinema(Nom, Adresse, Code_postal, Nb_salles)
VALUES
('CGR AMIENS','16 rue Corréus', '80000', 10),
('CGR ABBEVILLE','2 rue Menchecourt', '80100', 8),
('GAUMONT','32 rue du Colonel Film', '34400', 4),
('REX','3 avenue Robert Pimousse', '45667', 4)

INSERT INTO Salle(Nom, Nb_places, Cinema_id)
VALUES 
('A', 120, 1),
('B', 80, 1),
('C', 100, 1),
('D', 69, 1),
('E', 61, 1),
('F', 45, 1),
('G', 60, 1),
('H', 64, 1),
('I', 90, 1),
('J', 105, 1),
('A', 100, 2),
('B', 69, 2),
('C', 61, 2),
('D', 45, 2),
('E', 60, 2),
('F', 64, 2),
('G', 90, 2),
('H', 105, 2),
('Salle des Gaulois', 60, 3),
('Salle Pickachu', 75, 3),
('Salle XL', 250, 3),
('Salle XS', 40, 3),
('A', 55, 4),
('B', 68, 4),
('C', 54, 4),
('D', 69, 4)

INSERT INTO Language(Langue) VALUES ('Français'), ('Anglais'), ('Espagnol'), ('Allemand')

INSERT INTO Film(Titre, Duree, language_id)
VALUES
('Forrest Gump', 140, 1),
('La ligne verte', 190, 1),
('Babylon', 185, 1),
('Ne dis rien', 104, 1),
('Avatar 2', 200, 1),
('Tyler Rake 2', 116, 1),
('Tyler Rake 2', 116, 2),


INSERT INTO Client(Email, Password)
VALUES
('jojo@doudou.fr', '$2y$10$qegrxctgqN/fWcbwNC16yO.4NVvfhvOabDSKL16Hv/FhAbp5vHswK'),
('Jenny@lover.com', '$2y$10$g/gZoaa.q/glNZO7NQTe0.NFaPlRxi8Al377FSKUocih113woWap6'),
('johanCinema@orange.fr','$2y$10$Vi35syu2rZYnJFaranLLru0bsuPgrIApHQWtakgb3jS8Saekh/l5O'),
('loudoudou.mel@gmail.com', '$2y$10$bdVFTI/g0uSSms8mZqOQteq47UB6dExNkFuMwvIpnox.Bj2W.OdKq')


INSERT INTO Seance(Date_Heure, Places_restantes, film_id, Cinema_id, Salle_id)
VALUES
('2023-07-01 21:15:00', 83, 2, 1, 1),
('2023-07-01 21:15:00', 44, 2, 1, 2),
('2023-07-03 21:30:00', 12, 4, 2, 2),
('2023-07-04 21:00:00', 21, 1, 4, 4)


INSERT INTO Ticket(Nom_tarif, tarif, client_id, seance_id)
VALUES 
('plein tarif', 9.20, 1, 1),
('plein tarif', 9.20, 2, 2),
('Etudiant', 7.60, 3, 3), 
('moins de 14 ans', 5.90, 4,4)



INSERT INTO Administrateur(Email,Password,Droit,Cinema_id)
VALUES
('Admin1@rex.fr', '$2y$10$RFc1ItI7n6o8lX/E5Qmty.4a/ipQdI6bBIaiscsmMV1UG/fLjxmpq', 0, 1),
('Admin2@rex.fr', '$2y$10$/93PqCKC2xf.rDX7ziosTOVKsYct9YWLGYPOYd22ELFWFSDAlq/JG', 0, 1),
('Admin3@rex.fr', '$2y$10$QzhUm5nLTiFNugGsdvxzG.is34d7iKppMkYecs.PvZemzSYAWfejq', 0, 1),
('Admin4@rex.fr', '$2y$10$nTUkMLTrm1cTxnbsKgAHv.3Namd83mDurjxfHebnd.Xws9S9zApS2', 0, 1),
('SuperAdmin@rex.fr','$2y$10$O2LplFvmY5iyFqJ8wQUxDero5tFqilzNHuLUIq7PtG3NGR08fXDju', 1)


--------------------------------------------------------------------------------------
--------------------------------ADMINISTRATION BDD------------------------------------
--------------------------------------------------------------------------------------

-- Administrateur Tous les droits

GRANT ALL PRIVILEGES ON *.* TO 'SuperAdmin@rex.fr'@'complexes' IDENTIFIED BY '$2y$10$O2LplFvmY5iyFqJ8wQUxDero5tFqilzNHuLUIq7PtG3NGR08fXDju';

--Administrateur cinema avec possibilités d'ajout de données et vues des données 

GRANT SELECT, INSERT ON *.* TO `Admin1@rex.fr`@`complexe`;
GRANT INSERT ON `complexes`.`film` TO `Admin1@rex.fr`@`complexe`;
GRANT INSERT ON `complexes`.`seance` TO `Admin1@rex.fr`@`complexe`;


GRANT SELECT, INSERT ON *.* TO `Admin2@rex.fr`@`complexe`;
GRANT INSERT ON `complexes`.`film` TO `Admin2@rex.fr`@`complexe`;
GRANT INSERT ON `complexes`.`seance` TO `Admin2@rex.fr`@`complexe`;

GRANT SELECT, INSERT ON *.* TO `Admin3@rex.fr`@`complexe`;
GRANT INSERT ON `complexes`.`film` TO `Admin2@rex.fr`@`complexe`;
GRANT INSERT ON `complexes`.`seance` TO `Admin2@rex.fr`@`complexe`;

GRANT SELECT, INSERT ON *.* TO `Admin4@rex.fr`@`complexe`;
GRANT INSERT ON `complexes`.`film` TO `Admin2@rex.fr`@`complexe`;
GRANT INSERT ON `complexes`.`seance` TO `Admin2@rex.fr`@`complexe`;

--------------------------------------------------------------------------------------
--------------------------------SAUVEGARDE ET RESTAURATION BDD------------------------
--------------------------------------------------------------------------------------

--sauvegarde BDD
mysqldump -u root -p complexes > C:\Users\saint\Desktop\depotSQL\saveComplexes.sql

--restauration bdd
mysql -u root -p complexes < C:\Users\saint\Desktop\depotSQL\saveComplexes.sql