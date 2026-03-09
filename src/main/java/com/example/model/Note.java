package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Note")
public class Note {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Note")
    private int idNote;

    @ManyToOne
    @JoinColumn(name = "id_Etudiant")
    private Etudiant etudiant;

    @ManyToOne
    @JoinColumn(name = "id_Prof")
    private Prof prof;

    @ManyToOne
    @JoinColumn(name = "id_Matiere")
    private Matiere matiere;

    @Column(name = "note")
    private double note;

    public Note() {
    }

    public int getIdNote() {
        return idNote;
    }

    public void setIdNote(int idNote) {
        this.idNote = idNote;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

    public double getNote() {
        return note;
    }

    public void setNote(double note) {
        this.note = note;
    }
}