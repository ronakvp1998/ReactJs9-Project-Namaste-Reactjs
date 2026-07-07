CREATE DATABASE IF NOT EXISTS swiggy_db;
USE swiggy_db;
-- 1. Create Tables (Required if using MySQL with ddl-auto: validate)
CREATE TABLE IF NOT EXISTS menus (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     restaurant_id BIGINT UNIQUE,
                                     FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS menu_items (
                                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                          menu_id BIGINT,
                                          name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    price DOUBLE NOT NULL,
    is_veg BOOLEAN,
    image_id VARCHAR(255),
    FOREIGN KEY (menu_id) REFERENCES menus(id) ON DELETE CASCADE
    );

-- 2. Insert Menus (1-to-1 Mapping to Restaurants)
INSERT INTO menus (id, restaurant_id) VALUES
                                          (1, 1001), -- Waves Restaurant Menu
                                          (2, 1003), -- McDonald's Menu
                                          (3, 1004), -- Blue Tokai Menu
                                          (4, 1008); -- Behrouz Biryani Menu
-- Insert 30 Restaurants from the provided JSON files
INSERT INTO restaurants (id, name, cloudinary_image_id, locality, area_name, cost_for_two, avg_rating) VALUES
                                                                                                           (393840, 'Chinese Wok', 'e0839ff574213e6f35b3899ebf1fc597', 'Chikka Lakshmaiah Layout', 'Adugodi', '₹250 for two', 4.3),
                                                                                                           (392828, 'Big Bowl', 'RX_THUMBNAIL/IMAGES/VENDOR/2024/6/22/deff0d02-ca1d-4ef9-9d62-b0cbeabf33d3_392828.JPG', 'Chikka Lakshmaiah Layout', 'Adugodi', '₹250 for two', 4.3),
                                                                                                           (10576, 'Pizza Hut', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/9/1/bb48c990-87ae-4884-83d8-03d73f3cd2a7_10576.JPG', '6th Block', 'Koramangala', '₹350 for two', 4.3),
                                                                                                           (525247, 'Olio - The Wood Fired Pizzeria', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/17/4937d6d5-b725-4048-97dd-636a753d217a_525247.JPG', 'Roopena Agrahara', 'Bommanahalli', '₹300 for two', 4.2),
                                                                                                           (25620, 'KFC', 'RX_THUMBNAIL/IMAGES/VENDOR/2024/12/9/fc1726b6-290d-463d-9baa-d1c34c0542fc_25620.JPG', 'Intermediate Ring Road', 'Ejipura', '₹400 for two', 4.3),
                                                                                                           (1087169, 'Mealy - Your Everyday Meal', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/4/29/c3f3ea1a-ce72-4671-8ebb-4012734c1faa_1087169.jpg', 'KHB Colony', 'Koramangala', '₹200 for two', 4.2),
                                                                                                           (65075, 'Homely', 'xgwb49gf1wsle9zadntt', '6th Block', 'Koramangala', '₹200 for two', 4.4),
                                                                                                           (5934, 'Burger King', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/18/ac30c19f-5572-448a-9c6a-44be9d986625_5934.jpg', 'Koramangala', 'Koramangala', '₹350 for two', 4.2),
                                                                                                           (718556, 'Blue Tokai Coffee Roasters', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/2/24/304acdfd-4f39-43d2-9c01-b908a0a8110b_718556.JPG', 'Ghodbunder Road', 'Thane West', '₹600 for two', 4.5),
                                                                                                           (236178, 'Swamy - South Indian Food Express', 'mt6mhfey6rita3fpss9b', 'Next To Hakone', 'Thane Hiranandani Estate', '₹150 for two', 4.3),
                                                                                                           (552383, 'Burger King', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/18/67a2e0e0-06db-4cfb-8c14-822b6fc8a62e_552383.jpg', 'Hiranandani', 'Thane Hiranandani Estate', '₹350 for two', 4.3),
                                                                                                           (719052, 'Suchali''s Artisan Bakehouse', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/2/24/2a802ba8-0a79-4e75-8a54-610042f65308_719052.JPG', 'Ghodbunder Road', 'Thane', '₹600 for two', 4.6),
                                                                                                           (575023, 'Veg Darbar by Behrouz Biryani', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/9/9/47b05bdf-690a-4f7d-83c6-f3068c303efd_575023.JPG', 'Hill spring commercial, Vijay Garden Road', 'Thane Hiranandani Estate', '₹700 for two', 4.2),
                                                                                                           (34793, 'Theobroma', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/6/25/06d01cc1-a1ca-4ddc-aa28-1a1513fce7ea_34793.JPG', 'Thane West', 'Thane West', '₹400 for two', 4.5),
                                                                                                           (576026, 'Go Zero Ice Creams & Desserts', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/24/9f4f1cae-7994-4a81-ba6d-4d40fd448301_576026.JPG', 'Vartaknagar Manpada Zone', 'Hiranandani Estate', '₹150 for two', 4.7),
                                                                                                           (200279, 'Nothing but Chicken', 'rgiz2uz44dm7ol6oytpt', 'Hiranandani Estate, Thane West', 'Patlipada Hiranandani Estate', '₹400 for two', 4.5),
                                                                                                           (10551, 'Sweet Bengal', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/5/14/62ecbec5-642e-45ef-b491-e0b1681682d8_10551.JPG', 'Queen''s Gate', 'Hiranandani Estate', '₹150 for two', 4.7),
                                                                                                           (30305, 'Chaayos Chai+Snacks=Relax', 'RX_THUMBNAIL/IMAGES/VENDOR/2024/4/17/2ce18342-6c04-4ebc-9725-788819ddaa56_30305.JPG', 'Thane West', 'Thane West', '₹250 for two', 4.7),
                                                                                                           (801203, 'Makhani Darbar: Curries, Breads & Beyond', 'RX_THUMBNAIL/IMAGES/VENDOR/2024/12/20/3923c5e0-5186-4409-add0-0566b60eaeb8_801203.JPG', 'Thane Estate FC', 'Hill spring commercial, Vijay Garden Road', '₹500 for two', 4.3),
                                                                                                           (131601, 'McDonald''s', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/6/18/072bae8e-2716-4169-bfee-60e19acca472_131601.JPG', 'Opp.Thane Municipal Commissioner Bungalow', 'Thane West', '₹400 for two', 4.4),
                                                                                                           (395219, 'McDonald''s Gourmet Burger Collection', 'mdx8zkt8pa8cskmewhz6', 'Big Mall', 'Thane West', '₹600 for two', 4.4),
                                                                                                           (60181, 'Starbucks Coffee', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/5/4/80a4f6ef-af73-48b9-9dcf-2de8c8a2f87e_60181.JPG', 'Thane West', 'Thane Hiranandani Estate', '₹400 for two', 4.5),
                                                                                                           (380341, 'Prashant Corner', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/3/18/f5c0e188-d252-4237-8e8b-2b0e12856bb7_380341.jpg', 'Majiwada', 'Thane', '₹400 for two', 4.7),
                                                                                                           (743390, 'Bombay Sweet Shop', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/6/23/34133e9e-ca86-41b3-8975-dfa1d95797e8_743390.JPG', 'Pawar Nagar', 'Thane', '₹700 for two', 4.7),
                                                                                                           (10002, 'Subway', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/12/2996ff9f-5543-4a74-9f80-7a96c6a03951_10002.jpg', 'Hypercity, Thane(W)', 'Thane Hiranandani Estate', '₹350 for two', 4.3),
                                                                                                           (41587, 'Hangout Cakes & More', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/6/23/e7f48d59-c6aa-4aa7-9c8e-be97ebed99f1_41587.JPG', 'Hiranandani Meadows, Vasant Vihar', 'Thane West', '₹150 for two', 4.3),
                                                                                                           (128618, 'Monginis Cake Shop', 'qn0mtexltvqs637zjgdx', 'Valmiki Oswal Park', 'Thane West', '₹300 for two', 4.1),
                                                                                                           (186129, 'The Biryani Life', 'y2fbxiil0wrt1g6ulruu', 'Hill spring commercial, Vijay Garden Road', 'Thane West', '₹250 for two', 4.0),
                                                                                                           (167187, 'Hotel Vanakkam - Simply Tamilian', 'kvznnzbpaq0adrhpjkhs', 'Hiranandani Estate', 'Hiranandani Estate', '₹300 for two', 4.5),
                                                                                                           (799775, 'Third Wave Coffee', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/7/15/5d6a2e64-8aa8-48ea-b6b1-da0831031056_799775.JPG', 'Thane West', 'Thane West', '₹400 for two', 4.6);                                                                                              (30305, 'Chaayos Chai+Snacks=Relax', 'RX_THUMBNAIL/IMAGES/VENDOR/2024/4/17/2ce18342-6c04-4ebc-9725-788819ddaa56_30305.JPG', 'Thane West', 'Thane West', '₹250 for two', 4.7);