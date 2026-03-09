package com.example.repository;

import com.example.model.Matiere;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MatiereRepository extends JpaRepository<Matiere,Integer> {
}