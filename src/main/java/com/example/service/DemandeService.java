package com.example.service;

import org.springframework.stereotype.Service;
import com.example.model.Demande;
import com.example.model.Status;
import com.example.repository.DemandeRepository;
import com.example.repository.StatusRepository;

import java.util.List;

@Service
public class DemandeService {

    private final DemandeRepository demanderepository;
        private final StatusRepository statusRepository;

    public DemandeService(DemandeRepository demanderepository , StatusRepository statusRepository) {
        this.demanderepository = demanderepository;
        this.statusRepository = statusRepository;
    }

    public Demande ajouterClient(Demande demande) {
        return demanderepository.save(demande);
    }

    public List<Demande> getAllClients() {
        return demanderepository.findAll();
    }

    public Demande getClientById(Integer id) {
        return demanderepository.findById(id).orElse(null);
    }

    public void supprimerClient(Integer id) {
        demanderepository.deleteById(id);
    }

    public Demande modifierClient(Demande demande) {
    return demanderepository.save(demande);
}

public List<Status> getAllStatus() {
    return statusRepository.findAll();
}

public Status getStatusById(Integer id) {
    return statusRepository.findById(id).orElse(null);
}
   }