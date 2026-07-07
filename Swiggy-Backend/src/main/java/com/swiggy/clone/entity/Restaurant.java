package com.swiggy.clone.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "restaurants")
public class Restaurant {

    @Id
    private Long id;
    private String name;
    private String cloudinaryImageId;
    private String locality;
    private String areaName;
    private String costForTwo;
    private Double avgRating;

    // Constructors
    public Restaurant() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCloudinaryImageId() { return cloudinaryImageId; }
    public void setCloudinaryImageId(String cloudinaryImageId) { this.cloudinaryImageId = cloudinaryImageId; }

    public String getLocality() { return locality; }
    public void setLocality(String locality) { this.locality = locality; }

    public String getAreaName() { return areaName; }
    public void setAreaName(String areaName) { this.areaName = areaName; }

    public String getCostForTwo() { return costForTwo; }
    public void setCostForTwo(String costForTwo) { this.costForTwo = costForTwo; }

    public Double getAvgRating() { return avgRating; }
    public void setAvgRating(Double avgRating) { this.avgRating = avgRating; }
}