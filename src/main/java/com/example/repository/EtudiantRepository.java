package com.example.repository;

import com.example.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EtudiantRepository extends JpaRepository<Client, Integer> {
    // Ici tu peux ajouter des méthodes personnalisées si nécessaire
}