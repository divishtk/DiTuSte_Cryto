/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models;

import java.sql.Blob;

/**
 *
 * @author Nevets
 */
public class Article {
    int lab_id;
    String title, topic, rated, posted_on, lab_user, rating, docText, description;
    String last_mdoified;
    Blob data_file;

    public Article() {
    }

    public int getLab_id() {
        return lab_id;
    }

    public void setLab_id(int lab_id) {
        this.lab_id = lab_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getRated() {
        return rated;
    }

    public void setRated(String rated) {
        this.rated = rated;
    }

    public String getPosted_on() {
        return posted_on;
    }

    public void setPosted_on(String posted_on) {
        this.posted_on = posted_on;
    }

    public String getLab_user() {
        return lab_user;
    }

    public void setLab_user(String lab_user) {
        this.lab_user = lab_user;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getDocText() {
        return docText;
    }

    public void setDocText(String docText) {
        this.docText = docText;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLast_mdoified() {
        return last_mdoified;
    }

    public void setLast_mdoified(String last_mdoified) {
        this.last_mdoified = last_mdoified;
    }

    public Blob getData_file() {
        return data_file;
    }

    public void setData_file(Blob data_file) {
        this.data_file = data_file;
    }
    
    
}
