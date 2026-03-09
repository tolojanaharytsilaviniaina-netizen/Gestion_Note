package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name="Parametre")
public class Parametre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idParametre;

    @Column(name="id_Operateur")
    private int idOperateur;

    @Column(name="id_Matiere")
    private int idMatiere;

    @Column(name="id_Resolution")
    private int idResolution;

    @Column(name="Seuil")
    private double seuil;

    public int getIdParametre() {
        return idParametre;
    }

    public int getIdOperateur() {
        return idOperateur;
    }

    public int getIdMatiere() {
        return idMatiere;
    }

    public int getIdResolution() {
        return idResolution;
    }

    public double getSeuil() {
        return seuil;
    }
}