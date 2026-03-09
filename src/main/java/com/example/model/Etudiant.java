package com.example.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name="Etudiants")
public class Etudiant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_Etudiant")
    private int idEtudiant;

    @Column(name="nom")
    private String nom;

    @Column(name="numero")
    private int numero;

    @Column(name="Class_Etudiant")
    private String classEtudiant;

    @OneToMany(mappedBy="etudiant")
    private List<Note> notes;

    public int getIdEtudiant() {
        return idEtudiant;
    }

    public void setIdEtudiant(int idEtudiant) {
        this.idEtudiant = idEtudiant;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getClassEtudiant() {
        return classEtudiant;
    }

    public void setClassEtudiant(String classEtudiant) {
        this.classEtudiant = classEtudiant;
    }
}