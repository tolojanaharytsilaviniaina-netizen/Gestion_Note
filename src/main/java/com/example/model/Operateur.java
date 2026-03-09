package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name="Operateur")
public class Operateur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_Operateur")
    private int idOperateur;

    @Column(name="nom")
    private String nom;

    public int getIdOperateur() {
        return idOperateur;
    }

    public void setIdOperateur(int idOperateur) {
        this.idOperateur = idOperateur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}