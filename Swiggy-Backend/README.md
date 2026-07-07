# Swiggy Clone Backend API

A RESTful Spring Boot backend service designed to replicate the restaurant listing functionality of Swiggy. This project features a flexible data layer, allowing developers to seamlessly switch between a lightweight H2 in-memory database for rapid local development and a robust MySQL database for production-grade deployments.

---

## 🛠 Tech Stack

*   **Java:** 25
*   **Framework:** Spring Boot 3.5.x
*   **Build Tool:** Gradle
*   **Databases:** H2 (In-Memory) & MySQL (Relational)
*   **API Documentation:** Swagger / Springdoc OpenAPI
*   **Testing:** JUnit, Spring REST Docs, Testcontainers
*   **Containerization:** Docker & Docker Compose

---

## 🚀 Features

*   **CRUD Operations:** Fully functional endpoints to Create, Read, Update, and Delete restaurant records.
*   **Dual Database Support:** Easily toggle between H2 and MySQL without rewriting core application logic.
*   **Automatic Data Seeding:** Bootstraps the database with initial JSON-derived restaurant data on startup.
*   **Containerized:** Ready to deploy via Docker and Docker Compose.
*   **Interactive API Docs:** Built-in Swagger UI for easy endpoint testing.

---

## 🗄️ Database Configuration

This project is configured to support both H2 and MySQL. You can switch between them by adjusting your `application.yml` and `build.gradle` files, or by utilizing Spring Profiles.

### Option 1: H2 In-Memory Database (Default/Local Dev)
Ideal for quick testing and development. The database resets every time the application restarts.

1.  Ensure the H2 runtime dependency is active in `build.gradle`:
    ```groovy
    runtimeOnly 'com.h2database:h2'
    ```
2.  Use the following configuration in your `application.yml`:
    ```yaml
    spring:
      datasource:
        url: jdbc:h2:mem:swiggy_db;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
        driverClassName: org.h2.Driver
        username: sa
        password: password
      jpa:
        database-platform: org.hibernate.dialect.H2Dialect
        hibernate:
          ddl-auto: update
        defer-datasource-initialization: true
    ```

### Option 2: MySQL (Production/Persistent)
Ideal for persistent data storage and production environments.

1.  Ensure the MySQL driver is active in `build.gradle`:
    ```groovy
    runtimeOnly 'com.mysql:mysql-connector-j'
    ```
2.  Use the following configuration in your `application.yml`:
    ```yaml
    spring:
      datasource:
        url: jdbc:mysql://localhost:3306/swiggy_db?useSSL=false&allowPublicKeyRetrieval=true
        username: root
        password: rootpassword
      jpa:
        hibernate:
          ddl-auto: validate
        properties:
          hibernate:
            dialect: org.hibernate.dialect.MySQLDialect
    ```
    *(Note: If running via Docker Compose, change `localhost` to `mysql-db` in the URL).*

---

## 🐳 Running with Docker

You can spin up the entire application (and the MySQL database, if configured) using Docker.

1.  **Build and start the containers:**
    ```bash
    docker-compose up --build
    ```
2.  **Stop the containers:**
    ```bash
    docker-compose down
    ```

*Note: The `Dockerfile` is configured to skip tests during the image build process to prevent Testcontainer conflicts. Run your tests locally before building the image.*

---

## 💻 Running Locally (Without Docker)

To run the application directly on your host machine using Gradle:

1.  **Clean and build the project:**
    ```bash
    ./gradlew clean build
    ```
2.  **Run the Spring Boot application:**
    ```bash
    ./gradlew bootRun
    ```

---

## 📚 API Documentation & Tools

Once the application is running, you can access the following tools in your browser:

*   **Swagger UI (API Docs):** [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
*   **H2 Database Console:** [http://localhost:8080/h2-console](http://localhost:8080/h2-console)
    *   *JDBC URL:* `jdbc:h2:mem:swiggy_db`
    *   *Username:* `sa`
    *   *Password:* `password`