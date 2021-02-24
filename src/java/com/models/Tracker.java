/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models;

/**
 *
 * @author Nevets
 */
public class Tracker {
    String t_id, proj_Id, proj_name, take_notes, article_items, task_done, task_remaining, modified_date;

    public Tracker() {
    }

    public String getT_id() {
        return t_id;
    }

    public void setT_id(String t_id) {
        this.t_id = t_id;
    }

    public String getProj_Id() {
        return proj_Id;
    }

    public void setProj_Id(String proj_Id) {
        this.proj_Id = proj_Id;
    }

    public String getProj_name() {
        return proj_name;
    }

    public void setProj_name(String proj_name) {
        this.proj_name = proj_name;
    }

    public String getTake_notes() {
        return take_notes;
    }

    public void setTake_notes(String take_notes) {
        this.take_notes = take_notes;
    }

    public String getArticle_items() {
        return article_items;
    }

    public void setArticle_items(String article_items) {
        this.article_items = article_items;
    }

    public String getTask_done() {
        return task_done;
    }

    public void setTask_done(String task_done) {
        this.task_done = task_done;
    }

    public String getTask_remaining() {
        return task_remaining;
    }

    public void setTask_remaining(String task_remaining) {
        this.task_remaining = task_remaining;
    }

    public String getModified_date() {
        return modified_date;
    }

    public void setModified_date(String modified_date) {
        this.modified_date = modified_date;
    }
    
    
}
