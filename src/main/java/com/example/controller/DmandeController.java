package com.example.controller;

import com.example.model.Client;
import com.example.model.Demande;
import com.example.model.Status;
import com.example.service.ClientService;
import com.example.service.DemandeService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/Demande")
public class DmandeController {

    private final DemandeService demandeservice;
    private final ClientService clientService;

    public DmandeController(DemandeService demandeservice, ClientService clientService) {
        this.demandeservice = demandeservice;
        this.clientService = clientService;
    }

    @GetMapping("/formulaire")
    public String afficherFormulaire(Model model) {
        model.addAttribute("demande", new Demande());
        model.addAttribute("clients", clientService.getAllClients());
        model.addAttribute("statusList", demandeservice.getAllStatus());
        model.addAttribute("contentPage", "/WEB-INF/jsp/demandeForm.jsp"); 
        return "layout";
    }

    @PostMapping("/save")
    public String ajouterDemande(@ModelAttribute Demande demande) {

        // Lier le client
        Client client = clientService.getClientById(demande.getClient().getIdClients());
        demande.setClient(client);

        // Lier le status
        Status status = demandeservice.getStatusById(demande.getStatus().getIdStatus());
        demande.setStatus(status);

        demandeservice.ajouterClient(demande);

        return "redirect:/Demande/liste";
    }

    @GetMapping("/liste")
    public String listeClients(Model model) {
         model.addAttribute("demandes", demandeservice.getAllClients());
         model.addAttribute("contentPage", "/WEB-INF/jsp/listDemande.jsp"); 
        return "layout";
    }

    @GetMapping("/edit/{id}")
    public String modifierForm(@PathVariable("id") Integer id, Model model) {
        Demande demande = demandeservice.getClientById(id);
        if (demande == null) return "redirect:/Demande/liste";

        model.addAttribute("demande", demande);
        model.addAttribute("clients", clientService.getAllClients());
        model.addAttribute("statusList", demandeservice.getAllStatus());

        
         model.addAttribute("contentPage", "/WEB-INF/jsp/demandeForm.jsp"); 
        return "layout";
    }

    @GetMapping("/delete/{id}")
    public String deleteClient(@PathVariable("id") Integer id) {
        demandeservice.supprimerClient(id);
        return "redirect:/Demande/liste";
    }
}


