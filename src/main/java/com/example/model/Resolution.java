package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name="Resolution")
public class Resolution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_Resolution")
    private int idResolution;

    @Column(name="nom")
    private String nom;

    public int getIdResolution() {
        return idResolution;
    }

    public void setIdResolution(int idResolution) {
        this.idResolution = idResolution;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}