package com.example.service;

import org.springframework.stereotype.Service;
import com.example.model.Client;
import com.example.repository.ClientRepository;
import java.util.List;

@Service
public class ClientService {

    private final ClientRepository clientRepository;

    public ClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    public Client ajouterClient(Client client) {
        return clientRepository.save(client);
    }

    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }

    public Client getClientById(Integer id) {
        return clientRepository.findById(id).orElse(null);
    }

    public void supprimerClient(Integer id) {
        clientRepository.deleteById(id);
    }

    public Client modifierClient(Client client) {
    return clientRepository.save(client);
}


}