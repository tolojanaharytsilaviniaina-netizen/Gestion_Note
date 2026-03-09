package com.example.repository;

import com.example.model.Etudiant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EtudiantRepository extends JpaRepository<Etudiant, Integer> {
    // Ici tu peux ajouter des méthodes personnalisées si nécessaire
}