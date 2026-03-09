package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Prof")
public class Prof {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Prof")
    private int idProf;

    @Column(name = "nom")
    private String nom;

    public Prof() {
    }

    public int getIdProf() {
        return idProf;
    }

    public void setIdProf(int idProf) {
        this.idProf = idProf;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}