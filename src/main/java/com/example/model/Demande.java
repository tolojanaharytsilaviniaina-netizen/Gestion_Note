package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "demande")
public class Demande {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_demande")
    private Integer idDemande;

    // Relation ManyToOne vers Client
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_client")
    private Client client;

    // Relation ManyToOne vers Status
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_Status")
    private Status status;

    @Column(name = "Lieux", length = 225)
    private String lieux;

    @Column(name = "district", length = 225)
    private String district;

    public Demande() {}

    // Getters et Setters
    public Integer getIdDemande() { return idDemande; }
    public void setIdDemande(Integer idDemande) { this.idDemande = idDemande; }

    public Client getClient() { return client; }
    public void setClient(Client client) { this.client = client; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public String getLieux() { return lieux; }
    public void setLieux(String lieux) { this.lieux = lieux; }

    public String getDistrict() { return district; }
    public void setDistrict(String district) { this.district = district; }
}