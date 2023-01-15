package com.farm.farm.service;

import com.farm.farm.entity.post_entity;
import com.farm.farm.repository.post_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class post_service {

    @Autowired
    post_repository post_repository;

    public ArrayList<post_entity> getAllpost(){
        return (ArrayList<post_entity>) post_repository.findAll();
    }
    public post_entity savepost(post_entity tc_post){
        return post_repository.save(tc_post);

    }
    public Optional<post_entity> getpostById(int id){
        return post_repository.findById(id);

    }

    public boolean deletepostById (int id){
        try{
            post_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }

}
