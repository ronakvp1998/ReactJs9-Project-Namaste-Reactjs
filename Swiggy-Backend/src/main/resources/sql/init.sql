CREATE DATABASE IF NOT EXISTS swiggy_db;
USE swiggy_db;

CREATE TABLE IF NOT EXISTS restaurants (
                                           id BIGINT PRIMARY KEY,
                                           name VARCHAR(255) NOT NULL,
    cloudinary_image_id VARCHAR(255),
    locality VARCHAR(255),
    area_name VARCHAR(255),
    cost_for_two VARCHAR(100),
    avg_rating DOUBLE
    );

-- Extracted from the provided JSON data
INSERT INTO restaurants (id, name, cloudinary_image_id, locality, area_name, cost_for_two, avg_rating) VALUES
                                                                                                           (718556, 'Blue Tokai Coffee Roasters', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/2/24/304acdfd-4f39-43d2-9c01-b908a0a8110b_718556.JPG', 'Ghodbunder Road', 'Thane West', '₹600 for two', 4.5),
                                                                                                           (236178, 'Swamy - South Indian Food Express', 'mt6mhfey6rita3fpss9b', 'Next To Hakone', 'Thane Hiranandani Estate', '₹150 for two', 4.3),
                                                                                                           (552383, 'Burger King', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/18/67a2e0e0-06db-4cfb-8c14-822b6fc8a62e_552383.jpg', 'Hiranandani', 'Thane Hiranandani Estate', '₹350 for two', 4.3),
                                                                                                           (719052, 'Suchali\'s Artisan Bakehouse', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/2/24/2a802ba8-0a79-4e75-8a54-610042f65308_719052.JPG', 'Ghodbunder Road', 'Thane', '₹600 for two', 4.6),
(575023, 'Veg Darbar by Behrouz Biryani', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/9/9/47b05bdf-690a-4f7d-83c6-f3068c303efd_575023.JPG', 'Hill spring commercial, Vijay Garden Road', 'Thane Hiranandani Estate', '₹700 for two', 4.2),
(34793, 'Theobroma', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/6/25/06d01cc1-a1ca-4ddc-aa28-1a1513fce7ea_34793.JPG', 'Thane West', 'Thane West', '₹400 for two', 4.5),
(576026, 'Go Zero Ice Creams & Desserts', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/24/9f4f1cae-7994-4a81-ba6d-4d40fd448301_576026.JPG', 'Vartaknagar Manpada Zone', 'Hiranandani Estate', '₹150 for two', 4.7),
(200279, 'Nothing but Chicken', 'rgiz2uz44dm7ol6oytpt', 'Hiranandani Estate, Thane West', 'Patlipada Hiranandani Estate', '₹400 for two', 4.5),
(10551, 'Sweet Bengal', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/5/14/62ecbec5-642e-45ef-b491-e0b1681682d8_10551.JPG', 'Queen\'s Gate', 'Hiranandani Estate', '₹150 for two', 4.7),
                                                                                                           (30305, 'Chaayos Chai+Snacks=Relax', 'RX_THUMBNAIL/IMAGES/VENDOR/2024/4/17/2ce18342-6c04-4ebc-9725-788819ddaa56_30305.JPG', 'Thane West', 'Thane West', '₹250 for two', 4.7);