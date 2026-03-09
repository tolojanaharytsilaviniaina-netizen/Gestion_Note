package com.example.repository;

import com.example.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface NoteRepository extends JpaRepository<Note,Integer> {

    List<Note> findByEtudiantIdEtudiantAndMatiereIdMatiere(int idEtudiant,int idMatiere);

}