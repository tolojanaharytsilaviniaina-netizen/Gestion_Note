package com.example.repository;

import com.example.model.Prof;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfRepository extends JpaRepository<Prof, Integer> {
    // Ici aussi tu peux ajouter des méthodes personnalisées si nécessaire
}