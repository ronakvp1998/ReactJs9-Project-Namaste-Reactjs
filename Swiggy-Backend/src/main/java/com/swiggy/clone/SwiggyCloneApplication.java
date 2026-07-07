package com.swiggy.clone;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class SwiggyCloneApplication {

    public static void main(String[] args) {
        SpringApplication.run(SwiggyCloneApplication.class, args);
    }

    @Bean
    public CommandLineRunner loadData(JdbcTemplate jdbcTemplate) {
        return args -> {
            // Check if data already exists to avoid Duplicate Key exceptions on restarts
            Integer count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM restaurants", Integer.class);

            if (count != null && count == 0) {
                System.out.println("No data found. Seeding Swiggy Database...");

                String sql = """
                    -- 1. Insert 30 Restaurants
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
                    (552383, 'Burger King Thane', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/18/67a2e0e0-06db-4cfb-8c14-822b6fc8a62e_552383.jpg', 'Hiranandani', 'Thane Hiranandani Estate', '₹350 for two', 4.3),
                    (719052, 'Suchali''s Artisan Bakehouse', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/2/24/2a802ba8-0a79-4e75-8a54-610042f65308_719052.JPG', 'Ghodbunder Road', 'Thane', '₹600 for two', 4.6),
                    (575023, 'Veg Darbar by Behrouz Biryani', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/9/9/47b05bdf-690a-4f7d-83c6-f3068c303efd_575023.JPG', 'Hill spring commercial, Vijay Garden Road', 'Thane Hiranandani Estate', '₹700 for two', 4.2),
                    (34793, 'Theobroma', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/6/25/06d01cc1-a1ca-4ddc-aa28-1a1513fce7ea_34793.JPG', 'Thane West', 'Thane West', '₹400 for two', 4.5),
                    (576026, 'Go Zero Ice Creams & Desserts', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/6/24/9f4f1cae-7994-4a81-ba6d-4d40fd448301_576026.JPG', 'Vartaknagar Manpada Zone', 'Hiranandani Estate', '₹150 for two', 4.7),
                    (200279, 'Nothing but Chicken', 'rgiz2uz44dm7ol6oytpt', 'Hiranandani Estate, Thane West', 'Patlipada Hiranandani Estate', '₹400 for two', 4.5),
                    (10551, 'Sweet Bengal', 'RX_THUMBNAIL/IMAGES/VENDOR/2026/5/14/62ecbec5-642e-45ef-b491-e0b1681682d8_10551.JPG', 'Queen''s Gate', 'Hiranandani Estate', '₹150 for two', 4.7),
                    (30305, 'Chaayos Chai+Snacks=Relax', 'RX_THUMBNAIL/IMAGES/VENDOR/2024/4/17/2ce18342-6c04-4ebc-9725-788819ddaa56_30305.JPG', 'Thane West', 'Thane West', '₹250 for two', 4.7),
                    (801203, 'Makhani Darbar: Curries, Breads & Beyond', 'RX_THUMBNAIL/IMAGES/VENDOR/2024/12/20/3923c5e0-5186-4409-add0-0566b60eaeb8_801203.JPG', 'Thane Estate FC', 'Hill spring commercial', '₹500 for two', 4.3),
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
                    (799775, 'Third Wave Coffee', 'RX_THUMBNAIL/IMAGES/VENDOR/2025/7/15/5d6a2e64-8aa8-48ea-b6b1-da0831031056_799775.JPG', 'Thane West', 'Thane West', '₹400 for two', 4.6);

                    -- 2. Create the One-to-One Menus mapping
                    INSERT INTO menus (id, restaurant_id) VALUES 
                    (1, 393840), (2, 392828), (3, 10576), (4, 525247), (5, 25620), (6, 1087169), 
                    (7, 65075), (8, 5934), (9, 718556), (10, 236178), (11, 552383), (12, 719052), 
                    (13, 575023), (14, 34793), (15, 576026), (16, 200279), (17, 10551), (18, 30305), 
                    (19, 801203), (20, 131601), (21, 395219), (22, 60181), (23, 380341), (24, 743390), 
                    (25, 10002), (26, 41587), (27, 128618), (28, 186129), (29, 167187), (30, 799775);

                    -- 3. Insert Menu Items (Dishes)
                    INSERT INTO menu_items (menu_id, name, category, description, price, is_veg, image_id) VALUES
                    (1, 'Hakka Noodles', 'Mains', 'Classic wok tossed noodles with fresh veggies.', 199.0, true, 'hakka_img'),
                    (1, 'Chilli Chicken Dry', 'Starters', 'Crispy chicken tossed in spicy soya sauce.', 249.0, false, 'chilli_chicken_img'),
                    (2, 'Paneer Tikka Rice Bowl', 'Bowls', 'Spicy paneer tikka served over jeera rice.', 220.0, true, 'paneer_bowl_img'),
                    (2, 'Butter Chicken Rice Bowl', 'Bowls', 'Creamy butter chicken with basmati rice.', 260.0, false, 'butter_chicken_bowl_img'),
                    (3, 'Margherita Pizza', 'Pizzas', 'Classic cheese and tomato pizza with a pan crust.', 299.0, true, 'margherita_img'),
                    (3, 'Pepperoni Pizza', 'Pizzas', 'Loaded with spicy pepperoni and mozzarella cheese.', 450.0, false, 'pepperoni_img'),
                    (4, 'Truffle Mushroom Pizza', 'Pizzas', 'Wood fired pizza with truffle oil and wild mushrooms.', 550.0, true, 'truffle_pizza_img'),
                    (5, 'Zinger Burger', 'Burgers', 'Signature crispy chicken fillet with lettuce and mayo.', 180.0, false, 'zinger_img'),
                    (5, 'Hot & Crispy Chicken (4 pcs)', 'Chicken', 'Signature KFC fried chicken.', 400.0, false, 'hot_crispy_img'),
                    (6, 'Rajma Chawal Meal', 'Meals', 'Homestyle rajma served with steamed rice.', 150.0, true, 'rajma_chawal_img'),
                    (7, 'Mini Veg Thali', 'Thalis', '2 rotis, dal, dry sabzi, and rice.', 120.0, true, 'veg_thali_img'),
                    (8, 'Veg Whopper', 'Burgers', 'Our signature Whopper with a crispy veg patty.', 169.0, true, 'veg_whopper_img'),
                    (9, 'Iced Latte', 'Beverages', 'Espresso poured over milk and ice.', 220.0, true, 'iced_latte_img'),
                    (10, 'Masala Dosa', 'South Indian', 'Crispy dosa filled with spiced potato mash.', 110.0, true, 'masala_dosa_img'),
                    (11, 'Crispy Veg Burger', 'Burgers', 'Budget friendly crispy veg burger.', 69.0, true, 'crispy_veg_img'),
                    (12, 'Sourdough Loaf', 'Breads', 'Classic crusty sourdough bread.', 250.0, true, 'sourdough_img'),
                    (13, 'Subz-E-Falafel Biryani', 'Biryani', 'Aromatic rice cooked with fresh veggies and falafel.', 320.0, true, 'veg_biryani_img'),
                    (14, 'Overload Brownie', 'Desserts', 'Our signature dense chocolate brownie.', 110.0, true, 'brownie_img'),
                    (15, 'Sugar Free Vanilla', 'Ice Cream', 'Guilt-free classic vanilla tub.', 299.0, true, 'zero_vanilla_img'),
                    (16, 'Chicken Tikka Salad', 'Salads', 'Grilled chicken tikka with fresh greens.', 220.0, false, 'chicken_salad_img'),
                    (17, 'Rasgulla (2 Pcs)', 'Sweets', 'Spongy cottage cheese balls soaked in syrup.', 60.0, true, 'rasgulla_img'),
                    (18, 'Desi Chai', 'Beverages', 'Customizable Indian milk tea.', 120.0, true, 'desi_chai_img'),
                    (19, 'Dal Makhani', 'Mains', 'Slow-cooked black lentils in butter and cream.', 280.0, true, 'dal_makhani_img'),
                    (20, 'McAloo Tikki Burger', 'Burgers', 'A golden brown crispy aloo patty.', 59.0, true, 'mcaloo_tikki_img'),
                    (21, 'Cheese Lava Burger', 'Burgers', 'Premium burger with a cheese-filled patty.', 269.0, true, 'cheese_lava_img'),
                    (22, 'Java Chip Frappuccino', 'Beverages', 'Coffee blended with chocolate chips and ice.', 310.0, true, 'javachip_img'),
                    (23, 'Pani Puri (1 Plate)', 'Chaat', 'Crispy puris with spicy mint water.', 60.0, true, 'pani_puri_img'),
                    (24, 'Bombay Bhel Chikki', 'Sweets', 'A sweet and savory chikki made with bhel ingredients.', 300.0, true, 'bhel_chikki_img'),
                    (25, 'Paneer Tikka Sub (15cm)', 'Subs', 'Spicy paneer loaded with fresh veggies.', 210.0, true, 'paneer_sub_img'),
                    (26, 'Black Forest Cake (500g)', 'Cakes', 'Classic chocolate sponge with cherries and cream.', 450.0, true, 'black_forest_img'),
                    (27, 'Zebra Torte Pastry', 'Desserts', 'Vanilla and chocolate sponge layered with cream.', 55.0, true, 'zebra_torte_img'),
                    (28, 'Lucknowi Chicken Biryani', 'Biryani', 'Mildly spiced dum biryani from Awadh.', 279.0, false, 'lucknowi_biryani_img'),
                    (29, 'Podi Idli', 'South Indian', 'Mini idlis tossed in spicy gunpowder and ghee.', 120.0, true, 'podi_idli_img'),
                    (30, 'Sea Salt Mocha', 'Beverages', 'Mocha balanced with a hint of sea salt.', 250.0, true, 'sea_salt_mocha_img');
                """;

                // Split the massive text block by ';' and execute them individually
                String[] queries = sql.split(";");
                for (String query : queries) {
                    if (!query.trim().isEmpty()) {
                        jdbcTemplate.execute(query.trim());
                    }
                }

                System.out.println("Database seeding completed successfully!");
            } else {
                System.out.println("Database already seeded. Skipping initialization.");
            }
        };
    }
}