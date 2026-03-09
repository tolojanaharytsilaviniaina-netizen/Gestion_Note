package com.example.controller;

import com.example.service.NoteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/notes")
public class NoteController {

    private final NoteService noteService;

    public NoteController(NoteService noteService){
        this.noteService = noteService;
    }

    @GetMapping("/finale")
    public String noteFinale(
            @RequestParam int idEtudiant,
            @RequestParam int idMatiere,
            Model model){

        List<Double> notes = noteService.getNotes(idEtudiant,idMatiere);

        double diff = 0;
        double finalNote = 0;

        if(!notes.isEmpty()){
            diff = noteService.calculDifference(notes);
            finalNote = noteService.calculNoteFinale(idEtudiant,idMatiere);
        }

        model.addAttribute("notes", notes);
        model.addAttribute("difference", diff);
        model.addAttribute("noteFinale", finalNote);

        return "notefinale";
    }
}