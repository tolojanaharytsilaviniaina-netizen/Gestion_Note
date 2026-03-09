package com.example.controller;

import com.example.model.Note;
import com.example.model.Etudiant;
import com.example.model.Prof;
import com.example.model.Matiere;

import com.example.service.NoteService;
import com.example.repository.NoteRepository;
import com.example.repository.MatiereRepository;
import com.example.repository.EtudiantRepository;
import com.example.repository.ProfRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/notes")
public class NoteController {

    private final NoteService noteService;
    private final NoteRepository noteRepository;
    private final MatiereRepository matiereRepository;
    private final EtudiantRepository etudiantRepository;
    private final ProfRepository profRepository;

    // Injecter tous les repository nécessaires
    public NoteController(NoteService noteService,
                          NoteRepository noteRepository,
                          MatiereRepository matiereRepository,
                          EtudiantRepository etudiantRepository,
                          ProfRepository profRepository) {

        this.noteService = noteService;
        this.noteRepository = noteRepository;
        this.matiereRepository = matiereRepository;
        this.etudiantRepository = etudiantRepository;
        this.profRepository = profRepository;
    }

    // =========================
    // LISTE DES NOTES
    // =========================
    @GetMapping
    public String listNotes(Model model) {

        model.addAttribute("notes", noteRepository.findAll());
        model.addAttribute("matieres", matiereRepository.findAll());
        model.addAttribute("etudiants", etudiantRepository.findAll());
        model.addAttribute("profs", profRepository.findAll());

        return "note"; // JSP: note.jsp
    }

    // =========================
    // AJOUT NOTE
    // =========================
    @PostMapping("/save")
public String saveNote(@RequestParam int idEtudiant,
                       @RequestParam int idProf,
                       @RequestParam int idMatiere,
                       @RequestParam double note) {

    // Récupérer les entités existantes
    Etudiant e = etudiantRepository.findById(idEtudiant)
            .orElseThrow(() -> new RuntimeException("Étudiant introuvable : " + idEtudiant));

    Prof p = profRepository.findById(idProf)
            .orElseThrow(() -> new RuntimeException("Prof introuvable : " + idProf));

    Matiere m = matiereRepository.findById(idMatiere)
            .orElseThrow(() -> new RuntimeException("Matière introuvable : " + idMatiere));

    // Créer et sauvegarder la note
    Note n = new Note();
    n.setEtudiant(e);
    n.setProf(p);
    n.setMatiere(m);
    n.setNote(note);

    noteRepository.save(n);

    return "redirect:/notes";
}

    // =========================
    // DELETE NOTE
    // =========================
    @GetMapping("/delete")
    public String deleteNote(@RequestParam int id) {

        noteRepository.deleteById(id);

        return "redirect:/notes";
    }


    @GetMapping("/finaleForm")
public String finaleForm(Model model){
    model.addAttribute("etudiants", etudiantRepository.findAll());
    model.addAttribute("matieres", matiereRepository.findAll());
    return "finaleForm"; 
}

 
   @PostMapping("/calculFinale")
public String calculNoteFinaleForm(@RequestParam int idEtudiant,
                                   @RequestParam int idMatiere,
                                   Model model) {

    var notes = noteService.getNotes(idEtudiant, idMatiere);

    double diff = 0;
    double finalNote = 0;

    if(!notes.isEmpty()){
        diff = noteService.calculDifference(notes);
        finalNote = noteService.calculNoteFinale(idEtudiant, idMatiere);
    }

    model.addAttribute("notes", notes);
    model.addAttribute("difference", diff);
    model.addAttribute("noteFinale", finalNote);

    return "notefinale";
}
}