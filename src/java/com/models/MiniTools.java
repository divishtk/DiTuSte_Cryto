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
public class MiniTools {
    String lab_id;
    String title, desc, uploaded, lab_user, approved, last_mod, ratings,
            topic;
    Blob data_files, instruction_file;

    public MiniTools() {
    }

    public String getLab_id() {
        return lab_id;
    }

    public void setLab_id(String lab_id) {
        this.lab_id = lab_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Blob getData_files() {
        return data_files;
    }

    public void setData_files(Blob data_files) {
        this.data_files = data_files;
    }

    public String getUploaded() {
        return uploaded;
    }

    public void setUploaded(String uploaded) {
        this.uploaded = uploaded;
    }

    public String getLab_user() {
        return lab_user;
    }

    public void setLab_user(String lab_user) {
        this.lab_user = lab_user;
    }

    public String getApproved() {
        return approved;
    }

    public void setApproved(String approved) {
        this.approved = approved;
    }

    public String getLast_mod() {
        return last_mod;
    }

    public void setLast_mod(String last_mod) {
        this.last_mod = last_mod;
    }

    public String getRatings() {
        return ratings;
    }

    public void setRatings(String ratings) {
        this.ratings = ratings;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public Blob getInstruction_file() {
        return instruction_file;
    }

    public void setInstruction_file(Blob instruction_file) {
        this.instruction_file = instruction_file;
    }
    
}
