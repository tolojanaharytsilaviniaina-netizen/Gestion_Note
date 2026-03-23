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
(4,1,1,2,6),
(5,2,2,1,3),
(6,1,2,3,2);


INSERT INTO Etudiants VALUES
(1, 'candidat1', 101, 'L1'),
(2, 'candidat2', 102, 'L1');
 

INSERT INTO Prof VALUES
(1, 'correcteur1'),
(2, 'Correcteur2'),
(3, 'Correcteur3');

INSERT INTO Matiere VALUES
(1, 'JAVA', 201, 4),
(2, 'PHP', 202, 3);


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
(1, 1, 1, 1, 14.5),
(2, 1, 2, 1, 13.0);






(4, 1, 2, 2, 11.0),



(5, 2, 1, 1, 13.0),
(6, 2, 2, 1, 10.0),
(7, 2, 1, 2, 14.0),
(8, 2, 2, 2, 16.0);()



INSERT INTO Note VALUES
(4, 2, 1, 2, 15.5),
(5, 2, 2, 2, 12.0),
(6, 2, 3, 2, 17.5);

INSERT INTO Operateur(id_Operateur,nom) VALUES(3,">");
INSERT INTO Operateur(id_Operateur,nom) VALUES(1,"<");
INSERT INTO Operateur(id_Operateur,nom) VALUES(4,">=");
INSERT INTO Operateur(id_Operateur,nom) VALUES(2,"<=");
4
5
6
7

INSERT INTO Resolution(id_Resolution,nom) VALUES(1,"Petit");
INSERT INTO Resolution(id_Resolution,nom) VALUES(2,"Grand");
INSERT INTO Resolution(id_Resolution,nom) VALUES(3,"Moyenne");


