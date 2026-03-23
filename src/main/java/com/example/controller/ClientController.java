package com.example.controller;

import com.example.model.Client;
import com.example.service.ClientService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/client")
public class ClientController {

    private final ClientService clientService;

    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping("/formulaire")
    public String afficherFormulaire(Model model) {
        model.addAttribute("client", new Client()); 
         model.addAttribute("contentPage", "/WEB-INF/jsp/clientForm.jsp"); 
        return "layout";
    }


    @PostMapping("/save")
    public String ajouterClient(@ModelAttribute Client client) {
        clientService.ajouterClient(client);
        return "redirect:/client/liste"; 
    }


    @GetMapping("/liste")
    public String listeClients(Model model) {
        model.addAttribute("clients", clientService.getAllClients()); 
          model.addAttribute("contentPage", "/WEB-INF/jsp/listeClients.jsp"); 
        return "layout";
    }


    @GetMapping("/edit/{id}")
    public String modifierForm(@PathVariable("id") Integer id, Model model) {
    Client client = clientService.getClientById(id);
    model.addAttribute("client", client);
   model.addAttribute("contentPage", "/WEB-INF/jsp/clientForm.jsp"); 
        return "layout";
    }


    @GetMapping("/delete/{id}")
    public String deleteClient(@PathVariable("id") Integer id) {
        clientService.supprimerClient(id);
        return "redirect:/client/liste"; 
    }
}