package com.swiggy.clone.controller;

import com.swiggy.clone.entity.Restaurant;
import com.swiggy.clone.service.RestaurantService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/restaurants")
@Tag(name = "Restaurant Controller", description = "CRUD operations for Restaurants")
public class RestaurantController {

    private final RestaurantService service;

    public RestaurantController(RestaurantService service) {
        this.service = service;
    }

    @GetMapping
    @Operation(summary = "Get all restaurants")
    public List<Restaurant> getAll() {
        return service.getAllRestaurants();
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a restaurant by ID")
    public ResponseEntity<Restaurant> getById(@PathVariable Long id) {
        return service.getRestaurantById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    @Operation(summary = "Create a new restaurant")
    public Restaurant create(@RequestBody Restaurant restaurant) {
        return service.createRestaurant(restaurant);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update an existing restaurant")
    public ResponseEntity<Restaurant> update(@PathVariable Long id, @RequestBody Restaurant restaurant) {
        try {
            return ResponseEntity.ok(service.updateRestaurant(id, restaurant));
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete a restaurant")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.deleteRestaurant(id);
        return ResponseEntity.noContent().build();
    }
}