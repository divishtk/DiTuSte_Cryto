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
public class Project {
    String proj_Id, spec_id, proj_name, proj_desc, proj_path, proj_view_type, proj_tech, proj_language, modified_date;

    public Project() {
        
    }

    public String getProj_Id() {
        return proj_Id;
    }

    public void setProj_Id(String proj_Id) {
        this.proj_Id = proj_Id;
    }

    public String getSpec_id() {
        return spec_id;
    }

    public void setSpec_id(String spec_id) {
        this.spec_id = spec_id;
    }

    public String getProj_name() {
        return proj_name;
    }

    public void setProj_name(String proj_name) {
        this.proj_name = proj_name;
    }

    public String getProj_desc() {
        return proj_desc;
    }

    public void setProj_desc(String proj_desc) {
        this.proj_desc = proj_desc;
    }

    public String getProj_path() {
        return proj_path;
    }

    public void setProj_path(String proj_path) {
        this.proj_path = proj_path;
    }

    public String getProj_view_type() {
        return proj_view_type;
    }

    public void setProj_view_type(String proj_view_type) {
        this.proj_view_type = proj_view_type;
    }

    public String getProj_tech() {
        return proj_tech;
    }

    public void setProj_tech(String proj_tech) {
        this.proj_tech = proj_tech;
    }

    public String getProj_language() {
        return proj_language;
    }

    public void setProj_language(String proj_language) {
        this.proj_language = proj_language;
    }

    public String getModified_date() {
        return modified_date;
    }

    public void setModified_date(String modified_date) {
        this.modified_date = modified_date;
    }
    
    
}
