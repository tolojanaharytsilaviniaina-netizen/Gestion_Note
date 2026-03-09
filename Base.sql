CREATE DATABASES Gestion_Note;
\c Gestion_Note;


CREATE TABLE Etudiants(
    id_Etudiant INT PRIMARY KEY ,
    nom VARCHAR(225),
    numero INT,
    Class_Etudiant VARCHAR(225)
);

CREATE TABLE Prof(
    id_Prof INT PRIMARY KEY,
    nom VARCHAR(225)
);

CREATE TABLE Matiere (
    id_Matiere INT PRIMARY KEY,
    nom VARCHAR(225),
    numero INT,
    Coeff INT 
);

CREATE TABLE Note (
     id_Note INT PRIMARY KEY ,
     id_Etudiant INT,
     id_Prof INT,
     id_Matiere INT,
     note DOUBLE,

     Foreign Key (id_Matiere) REFERENCES Matiere(id_Matiere),
     Foreign Key (id_Prof) REFERENCES Prof(id_Prof),     
     Foreign Key (id_Etudiant) REFERENCES Etudiants(id_Etudiant)

);

CREATE TABLE Operateur (
    id_Operateur INT PRIMARY KEY,
    nom VARCHAR(225)
);

CREATE TABLE Resolution(
    id_Resolution INT PRIMARY KEY,
    nom VARCHAR(225) 
);

CREATE TABLE Parametre(
    id_Parametre INT PRIMARY KEY,
    id_Operateur INT,
    id_Matiere INT,
    id_Resolution INT,
    Seuil INT,

     Foreign Key (id_Matiere) REFERENCES Matiere(id_Matiere),
     Foreign Key (id_Resolution) REFERENCES Resolution(id_Resolution),
     Foreign Key (id_Operateur) REFERENCES Operateur(id_Operateur)
);

CREATE TABLE Note_Finale(
    id_NF INT PRIMARY KEY,
    id_Etudiant INT,
    note DOUBLE,

    Foreign Key (id_Etudiant) REFERENCES Etudiants (id_Etudiant)
);



INSERT INTO Parametre(id_Parametre,id_Operateur,id_Matiere,id_Resolution,Seuil) VALUES
(1,1,1,2,5),
(2,2,1,1,3),
(3,1,1,3,5);


INSERT INTO Parametre(id_Parametre,id_Operateur,id_Matiere,id_Resolution,Seuil) VALUES
(4,1,2,2,6),
(5,2,2,1,3),
(6,1,2,3,2);


INSERT INTO Etudiants VALUES
(1, 'Jean', 101, 'L1'),
(2, 'Marie', 102, 'L1'),
(3, 'Paul', 103, 'L2');  

INSERT INTO Prof VALUES
(1, 'Rakoto'),
(2, 'Rabe'),
(3, 'Rasoa');

INSERT INTO Matiere VALUES
(1, 'Math', 201, 4),
(2, 'Physique', 202, 3),
(3, 'Informatique', 203, 5);



CREATE TABLE Note (
     id_Note INT PRIMARY KEY ,
     id_Etudiant INT,
     id_Prof INT,
     id_Matiere INT,
     note DOUBLE,

     Foreign Key (id_Matiere) REFERENCES Matiere(id_Matiere),
     Foreign Key (id_Prof) REFERENCES Prof(id_Prof),     
     Foreign Key (id_Etudiant) REFERENCES Etudiants(id_Etudiant)

);

INSERT INTO Note VALUES
(7, 1, 1, 2, 10.0),
(8, 1, 2, 2, 11.0),
(9, 1, 3, 2, 12.5);



INSERT INTO Note VALUES
(4, 2, 1, 2, 15.5),
(5, 2, 2, 2, 12.0),
(6, 2, 3, 2, 17.5);

INSERT INTO Operateur(id_Operateur,nom) VALUES(1,">");
INSERT INTO Operateur(id_Operateur,nom) VALUES(2,"<");


INSERT INTO Resolution(id_Resolution,nom) VALUES(1,"Plus Petit");
INSERT INTO Resolution(id_Resolution,nom) VALUES(2,"Plus Grand");
INSERT INTO Resolution(id_Resolution,nom) VALUES(3,"Moyenne");


