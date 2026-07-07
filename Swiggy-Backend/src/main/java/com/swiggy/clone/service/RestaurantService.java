package com.swiggy.clone.service;

import com.swiggy.clone.entity.Restaurant;
import com.swiggy.clone.repository.RestaurantRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RestaurantService {

    private final RestaurantRepository repository;

    public RestaurantService(RestaurantRepository repository) {
        this.repository = repository;
    }

    public List<Restaurant> getAllRestaurants() {
        return repository.findAll();
    }

    public Optional<Restaurant> getRestaurantById(Long id) {
        return repository.findById(id);
    }

    public Restaurant createRestaurant(Restaurant restaurant) {
        return repository.save(restaurant);
    }

    public Restaurant updateRestaurant(Long id, Restaurant updatedRestaurant) {
        return repository.findById(id).map(restaurant -> {
            restaurant.setName(updatedRestaurant.getName());
            restaurant.setCloudinaryImageId(updatedRestaurant.getCloudinaryImageId());
            restaurant.setLocality(updatedRestaurant.getLocality());
            restaurant.setAreaName(updatedRestaurant.getAreaName());
            restaurant.setCostForTwo(updatedRestaurant.getCostForTwo());
            restaurant.setAvgRating(updatedRestaurant.getAvgRating());
            return repository.save(restaurant);
        }).orElseThrow(() -> new RuntimeException("Restaurant not found"));
    }

    public void deleteRestaurant(Long id) {
        repository.deleteById(id);
    }
}