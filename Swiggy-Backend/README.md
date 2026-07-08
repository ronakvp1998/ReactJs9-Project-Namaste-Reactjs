# Swiggy Clone Backend API

A RESTful Spring Boot backend service designed to replicate the restaurant listing functionality of Swiggy. This project features a flexible data layer, allowing developers to seamlessly switch between a lightweight H2 in-memory database for rapid local development and a robust MySQL database for production-grade deployments using Spring Profiles[cite: 3].

---

## 🛠 Tech Stack

* **Java:** 25
* **Framework:** Spring Boot 3.5.x
* **Build Tool:** Gradle
* **Databases:** H2 (In-Memory) & MySQL (Relational)
* **API Documentation:** Swagger / Springdoc OpenAPI
* **Testing:** JUnit, Spring REST Docs, Testcontainers
* **Containerization:** Docker & Docker Compose

---

## 🚀 Features

* **Complete Restaurant Details API:** Fetch a restaurant's image metadata, location, full nested menu items, and user reviews in a single aggregated REST call (`/api/v1/restaurants/{id}/details`).
* **CRUD Operations:** Fully functional endpoints to Create, Read, Update, and Delete restaurant records.
* **Spring Profiles Support:** Easily toggle between H2 (`immemory`), local MySQL (`local`), and Docker MySQL (`docker`) environments via profiles.
* **Automatic Data Seeding:** Bootstraps the database with nearly 30 authentic restaurant records and nested data derived from real JSON payloads on startup.
* **Containerized:** Ready to deploy via Docker and Docker Compose.
* **Interactive API Docs:** Built-in Swagger UI for easy endpoint testing.

---

## 📡 API Endpoints

### Core Restaurant APIs
* `GET /api/v1/restaurants` - Get a list of all restaurants.
* `GET /api/v1/restaurants/{id}` - Get basic restaurant details by ID.
* `GET /api/v1/restaurants/{id}/details` - **[NEW]** Get full restaurant details including:
    * Images and Location Meta (Cloudinary ID, Area, Locality)
    * Nested Menu Categories and Menu Items
    * List of Reviewers, Ratings, and Comments
* `POST /api/v1/restaurants` - Create a new restaurant.
* `PUT /api/v1/restaurants/{id}` - Update an existing restaurant.
* `DELETE /api/v1/restaurants/{id}` - Delete a restaurant.

---

## 🗄️ Database Configuration (Spring Profiles)

This project is configured to support both H2 and MySQL using **Spring Profiles**[cite: 3]. The base configuration (`application.yml`) sets up the MySQL dialect by default, and environment-specific properties are loaded via profile-specific YAML files.

### Profile: `immemory` (H2 In-Memory Database)
Ideal for quick testing and development. The database resets every time the application restarts.
* **Run Locally:**
    ```bash
    SPRING_PROFILES_ACTIVE=immemory ./gradlew bootRun
    ```

### Profile: `local` (Local MySQL)
Ideal for local development with a persistent MySQL database running on your host machine (`localhost:3306`).
* **Run Locally:**
    ```bash
    SPRING_PROFILES_ACTIVE=local ./gradlew bootRun
    ```

### Profile: `docker` (Docker MySQL)
Used when running the application within a Docker container.
* **Note:** This profile is automatically activated when running the application via `docker-compose`.

---

## 🐳 Running with Docker

You can spin up the entire application and the MySQL database using Docker Compose. The configuration is already set to use the `docker` profile automatically.

1.  **Build and start the containers:**
    ```bash
    docker-compose up --build
    ```
2.  **Stop the containers:**
    ```bash
    docker-compose down
    ```

---

## 📚 API Documentation & Tools

Once the application is running, you can access the following tools in your browser:

* **Swagger UI (API Docs):** [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
* **H2 Database Console:** [http://localhost:8080/h2-console](http://localhost:8080/h2-console) *(Note: Only accessible if running with the `immemory` profile)*
    * *JDBC URL:* `jdbc:h2:mem:swiggy_db`
    * *Username:* `sa`
    * *Password:* `password`