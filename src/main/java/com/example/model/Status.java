package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Statu")
public class Status {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name = "id_Status")
    private Integer idStatus;   

    @Column(name = "Libelle", length = 225)  
    private String libelle;

    public Status() {
    }

    public Integer getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(Integer idStatus) {
        this.idStatus = idStatus;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    
}