// package com.example.controller;

// import com.example.model.Parametre;
// import com.example.model.Matiere;
// import com.example.model.Operateur;
// import com.example.model.Resolution;


// import com.example.repository.ParametreRepository;
// import com.example.repository.MatiereRepository;
// import com.example.repository.OperateurRepository;
// import com.example.repository.ResolutionRepository;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.*;

// @Controller
// public class ParametreController {

//     @Autowired
//     ParametreRepository parametreRepository;

//     @Autowired
//     MatiereRepository matiereRepository;

//     @Autowired
//     OperateurRepository operateurRepository;

//     @Autowired
//     ResolutionRepository resolutionRepository;

// @GetMapping("/parametre")
// public String formulaire(Model model){

//     model.addAttribute("matieres", matiereRepository.findAll());
//     model.addAttribute("operateurs", operateurRepository.findAll());
//     model.addAttribute("resolutions", resolutionRepository.findAll());

//     return "parametre";
// }

//     @PostMapping("/saveParametre")
//     public String saveParametre(@RequestParam int idMatiere,
//                                 @RequestParam int idOperateur,
//                                 @RequestParam int idResolution,
//                                 @RequestParam double seuil){

//         Parametre p = new Parametre();

//         p.setIdMatiere(idMatiere);
//         p.setIdOperateur(idOperateur);
//         p.setIdResolution(idResolution);
//         p.setSeuil(seuil);

//         parametreRepository.save(p);

//         return "redirect:/parametre";
//     }
// }