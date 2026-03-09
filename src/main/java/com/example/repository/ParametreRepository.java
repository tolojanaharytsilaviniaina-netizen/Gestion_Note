package com.example.repository;

import com.example.model.Parametre;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ParametreRepository extends JpaRepository<Parametre,Integer> {

    List<Parametre> findByIdMatiereOrderByIdParametreAsc(int idMatiere);

}