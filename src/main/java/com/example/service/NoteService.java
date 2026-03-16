package com.example.service;

import com.example.model.Note;
import com.example.model.Parametre;
import com.example.repository.NoteRepository;
import com.example.repository.ParametreRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NoteService {

    private final NoteRepository noteRepository;
    private final ParametreRepository parametreRepository;

    public NoteService(NoteRepository noteRepository,
                       ParametreRepository parametreRepository){
        this.noteRepository = noteRepository;
        this.parametreRepository = parametreRepository;
    }


    public List<Double> getNotes(int idEtudiant,int idMatiere){
        List<Note> notes = noteRepository
                .findByEtudiantIdEtudiantAndMatiereIdMatiere(idEtudiant,idMatiere);

        List<Double> result = new ArrayList<>();
        for(Note n : notes){
            result.add(n.getNote());
        }
        return result;
    }


    public double calculDifference(List<Double> notes){

        double diff = 0;

        for(int i=0;i<notes.size();i++){
            for(int j=i+1;j<notes.size();j++){
                diff += Math.abs(notes.get(i)-notes.get(j));
            }
        }
        return diff;
    }


    public double maxNote(List<Double> notes){
        double max = notes.get(0);
        for(double n : notes){
            if(n > max){
                max = n;
            }
        }
        return max;
    }


    public double minNote(List<Double> notes){

        double min = notes.get(0);

        for(double n : notes){
            if(n < min){
                min = n;
            }
        }

        return min;
    }


    public double moyenne(List<Double> notes){

        double sum = 0;

        for(double n : notes){
            sum += n;
        }

        return sum / notes.size();
    }


    public double appliquerResolution(int idResolution,List<Double> notes){

        if(idResolution == 1){
            return minNote(notes);
        }

        if(idResolution == 2){
            return maxNote(notes);
        }

        if(idResolution == 3){
            return moyenne(notes);
        }

        return moyenne(notes);
    }
public double calculNoteFinale(int idEtudiant,int idMatiere){

    List<Double> notes = getNotes(idEtudiant,idMatiere);

    if(notes.isEmpty()){
        return 0;
    }

    double diff = calculDifference(notes);

    List<Parametre> parametres =
        parametreRepository.findByIdMatiereOrderByIdParametreAsc(idMatiere);

    Parametre meilleurParametre = null;
    double distanceMin = Double.MAX_VALUE;

    for(Parametre p : parametres){

        boolean condition = false;

        if(p.getIdOperateur() == 1){
            condition = diff < p.getSeuil();
        }
        else if(p.getIdOperateur() == 2){
            condition = diff <= p.getSeuil();
        }
        else if(p.getIdOperateur() == 3){
            condition = diff > p.getSeuil();
        }
        else if(p.getIdOperateur() == 4){
            condition = diff >= p.getSeuil();
        }

        if(condition){

            double distance = Math.abs(diff - p.getSeuil());
            if(meilleurParametre == null || distance < distanceMin){
                distanceMin = distance;
                meilleurParametre = p;
            }

            else if(distance == distanceMin && p.getSeuil() < meilleurParametre.getSeuil()){
                meilleurParametre = p;
            }
        }
    }

    if(meilleurParametre != null){
        return appliquerResolution(meilleurParametre.getIdResolution(),notes);
    }

    return moyenne(notes);
}


















//     public void ParcouirirParametreAvecDiff(){

//    double diff = calculDifference(getNotes(0, 0));

//      for(Parametre p : parametre){

//          for (int i = 0 , i<Parametre.size() ; i++){
//                         for (int j = 0 , i<Parametre.getEcart.size() ; i++){
//                              diff 
//                         }

//          }
//      }


    }
