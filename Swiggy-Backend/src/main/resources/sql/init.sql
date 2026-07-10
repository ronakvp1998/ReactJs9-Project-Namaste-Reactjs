CREATE DATABASE IF NOT EXISTS swiggy_db;
USE swiggy_db;

-- ==========================================
-- 1. TABLE STRUCTURES (SCHEMA)
-- ==========================================
CREATE TABLE IF NOT EXISTS restaurants (
                                           id BIGINT PRIMARY KEY,
                                           name VARCHAR(255),
    cloudinary_image_id VARCHAR(255),
    locality VARCHAR(255),
    area_name VARCHAR(255),
    cost_for_two VARCHAR(100),
    avg_rating DOUBLE,
    promoted BOOLEAN DEFAULT false
    );

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

CREATE TABLE IF NOT EXISTS reviews (
                                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                       restaurant_id BIGINT,
                                       reviewer_name VARCHAR(100),
    comment TEXT,
    rating INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
    );

-- ==========================================
-- 2. INSERT 25 RESTAURANTS
-- ==========================================
INSERT INTO restaurants (id, name, cloudinary_image_id, locality, area_name, cost_for_two, avg_rating) VALUES
                                                                                                           (10002, 'Subway', '2996ff9f-5543-4a74-9f80', 'Hypercity, Thane(W)', 'Thane Hiranandani Estate', '₹350 for two', 4.3),
                                                                                                           (131601, 'McDonald''s', '072bae8e-2716-4169-bfee', 'Opp. Municipal Bungalow', 'Thane West', '₹400 for two', 4.4),
                                                                                                           (34793, 'Theobroma', '06d01cc1-a1ca-4ddc-aa28', 'Thane West', 'Thane West', '₹400 for two', 4.5),
                                                                                                           (60181, 'Starbucks Coffee', '80a4f6ef-af73-48b9-9dcf', 'Thane West', 'Thane Hiranandani Estate', '₹400 for two', 4.5),
                                                                                                           (30305, 'Chaayos Chai+Snacks', '2ce18342-6c04-4ebc-9725', 'Thane West', 'Thane West', '₹250 for two', 4.7),
                                                                                                           (10551, 'Sweet Bengal', '62ecbec5-642e-45ef-b491', 'Queen''s Gate', 'Hiranandani Estate', '₹150 for two', 4.7),
                                                                                                           (743390, 'Bombay Sweet Shop', '34133e9e-ca86-41b3-8975', 'Pawar Nagar', 'Thane', '₹700 for two', 4.7),
                                                                                                           (236178, 'Swamy South Indian', 'mt6mhfey6rita3fpss9b', 'Next To Hakone', 'Thane Hiranandani Estate', '₹150 for two', 4.3),
                                                                                                           (719052, 'Suchali''s Artisan Bakehouse', '2a802ba8-0a79-4e75-8a54', 'Ghodbunder Road', 'Thane', '₹600 for two', 4.6),
                                                                                                           (575023, 'Veg Darbar by Behrouz', '47b05bdf-690a-4f7d-83c6', 'Vijay Garden Road', 'Thane Hiranandani', '₹700 for two', 4.2),
                                                                                                           (576026, 'Go Zero Ice Creams', '9f4f1cae-7994-4a81-ba6d', 'Vartaknagar Manpada', 'Hiranandani Estate', '₹150 for two', 4.7),
                                                                                                           (200279, 'Nothing but Chicken', 'rgiz2uz44dm7ol6oytpt', 'Hiranandani Estate', 'Patlipada', '₹400 for two', 4.5),
                                                                                                           (801203, 'Makhani Darbar', '3923c5e0-5186-4409-add0', 'Thane Estate FC', 'Vijay Garden Road', '₹500 for two', 4.3),
                                                                                                           (380341, 'Prashant Corner', 'f5c0e188-d252-4237-8e8b', 'Majiwada', 'Thane', '₹400 for two', 4.7),
                                                                                                           (41587, 'Hangout Cakes & More', 'e7f48d59-c6aa-4aa7-9c8e', 'Vasant Vihar', 'Thane West', '₹150 for two', 4.3),
                                                                                                           (128618, 'Monginis Cake Shop', 'qn0mtexltvqs637zjgdx', 'Valmiki Oswal Park', 'Thane West', '₹300 for two', 4.1),
                                                                                                           (186129, 'The Biryani Life', 'y2fbxiil0wrt1g6ulruu', 'Vijay Garden Road', 'Thane West', '₹250 for two', 4.0),
                                                                                                           (167187, 'Hotel Vanakkam', 'kvznnzbpaq0adrhpjkhs', 'Hiranandani Estate', 'Hiranandani Estate', '₹300 for two', 4.5),
                                                                                                           (799775, 'Third Wave Coffee', '5d6a2e64-8aa8-48ea-b6b1', 'Thane West', 'Thane West', '₹400 for two', 4.6),
                                                                                                           (1200310, 'Rasobongo', '8f1a8a3a-1d1b-45d5-8195', 'Thane Hiranandani', 'Thane Hiranandani', '₹100 for two', 4.5),
                                                                                                           (299968, 'Bala Dosa Plaza', 'co6lvkimournlhxktdj3', 'Manpada', 'Manpada', '₹200 for two', 4.6),
                                                                                                           (392828, 'Big Bowl', 'deff0d02-ca1d-4ef9-9d62', 'Chikka Lakshmaiah', 'Adugodi', '₹250 for two', 4.3);


INSERT INTO restaurants (id, name, cloudinary_image_id, locality, area_name, cost_for_two, avg_rating,promoted) VALUES
                                                                                                           (393840, 'Chinese Wok', 'e0839ff574213e6f35b3899ebf1fc597', 'Chikka Lakshmaiah Layout', 'Adugodi', '₹250 for two', 4.3,true),
                                                                                                           (552383, 'Burger King', '67a2e0e0-06db-4cfb-8c14', 'Hiranandani', 'Thane Hiranandani Estate', '₹350 for two', 4.3,true),
                                                                                                           (718556, 'Blue Tokai Coffee Roasters', '304acdfd-4f39-43d2-9c01', 'Ghodbunder Road', 'Thane West', '₹600 for two', 4.5,true);


-- ==========================================
-- 3. INSERT MENUS (1 for each restaurant)
-- ==========================================
INSERT INTO menus (id, restaurant_id) VALUES
                                          (1, 393840), (2, 552383), (3, 718556), (4, 10002), (5, 131601),
                                          (6, 34793), (7, 60181), (8, 30305), (9, 10551), (10, 743390),
                                          (11, 236178), (12, 719052), (13, 575023), (14, 576026), (15, 200279),
                                          (16, 801203), (17, 380341), (18, 41587), (19, 128618), (20, 186129),
                                          (21, 167187), (22, 799775), (23, 1200310), (24, 299968), (25, 392828);

-- ==========================================
-- 4. INSERT 250 MENU ITEMS (10 per Menu)
-- ==========================================
-- Asian / Chinese (Menus 1 & 25)
INSERT INTO menu_items (menu_id, name, category, description, price, is_veg, image_id) VALUES
                                                                                           (1, 'Hakka Noodles', 'Mains', 'Classic wok tossed noodles.', 199.0, true, 'hakka_img'),
                                                                                           (1, 'Chicken Fried Rice', 'Mains', 'Fried rice with diced chicken.', 220.0, false, 'cfr_img'),
                                                                                           (1, 'Veg Manchurian', 'Starters', 'Crispy veg balls in soy gravy.', 180.0, true, 'manchurian_img'),
                                                                                           (1, 'Chilli Paneer', 'Starters', 'Spicy paneer chunks wok tossed.', 210.0, true, 'chillipaneer_img'),
                                                                                           (1, 'Spring Rolls', 'Starters', 'Crispy fried rolls filled with veggies.', 150.0, true, 'springroll_img'),
                                                                                           (1, 'Manchow Soup', 'Soups', 'Dark brown soup prepared with various vegetables.', 120.0, true, 'manchow_img'),
                                                                                           (1, 'Sweet Corn Soup', 'Soups', 'Healthy and tasty sweet corn soup.', 110.0, true, 'cornsoup_img'),
                                                                                           (1, 'Chicken Dimsum', 'Starters', 'Steamed momos stuffed with chicken.', 180.0, false, 'dimsum_img'),
                                                                                           (1, 'Schezwan Fried Rice', 'Mains', 'Spicy fried rice wok tossed with schezwan sauce.', 210.0, true, 'sch_rice_img'),
                                                                                           (1, 'Honey Chilli Potato', 'Starters', 'Crispy fries coated in sweet & spicy sauce.', 160.0, true, 'hcp_img'),

                                                                                           (25, 'Paneer Tikka Bowl', 'Bowls', 'Paneer tikka served with jeera rice.', 220.0, true, 'bowl_paneer'),
                                                                                           (25, 'Chicken Curry Bowl', 'Bowls', 'Homestyle chicken curry with rice.', 240.0, false, 'bowl_chicken'),
                                                                                           (25, 'Dal Makhani Bowl', 'Bowls', 'Creamy dal makhani with jeera rice.', 190.0, true, 'bowl_dal'),
                                                                                           (25, 'Rajma Chawal', 'Bowls', 'Classic punjabi rajma chawal bowl.', 180.0, true, 'bowl_rajma'),
                                                                                           (25, 'Chilli Chicken Bowl', 'Bowls', 'Spicy chilli chicken over hakka noodles.', 250.0, false, 'bowl_chillichick'),
                                                                                           (25, 'Manchurian Rice Bowl', 'Bowls', 'Veg manchurian over fried rice.', 210.0, true, 'bowl_manchurian'),
                                                                                           (25, 'Chole Bhature Bowl', 'Bowls', 'Spicy chole served with bhature.', 200.0, true, 'bowl_chole'),
                                                                                           (25, 'Egg Curry Bowl', 'Bowls', 'Spicy egg curry with steamed rice.', 190.0, false, 'bowl_egg'),
                                                                                           (25, 'Mutton Kheema Bowl', 'Bowls', 'Minced mutton cooked with spices over rice.', 300.0, false, 'bowl_kheema'),
                                                                                           (25, 'Gulab Jamun (2 pcs)', 'Dessert', 'Soft milk dumplings soaked in sugar syrup.', 60.0, true, 'bowl_dessert');

-- Fast Food & Burgers (Menus 2, 4, 5)
INSERT INTO menu_items (menu_id, name, category, description, price, is_veg, image_id) VALUES
                                                                                           (2, 'Veg Whopper', 'Burgers', 'Signature Whopper with a crispy veg patty.', 169.0, true, 'veg_whopper_img'),
                                                                                           (2, 'Chicken Whopper', 'Burgers', 'Signature Whopper with a grilled chicken patty.', 199.0, false, 'chick_whopper_img'),
                                                                                           (2, 'Crispy Veg Burger', 'Burgers', 'Basic crispy veg burger.', 70.0, true, 'crispy_veg'),
                                                                                           (2, 'Medium Fries', 'Sides', 'Salted french fries.', 90.0, true, 'fries_img'),
                                                                                           (2, 'Onion Rings', 'Sides', 'Crispy battered onion rings.', 110.0, true, 'onion_rings'),
                                                                                           (2, 'Coke', 'Beverages', 'Chilled Coca Cola.', 60.0, true, 'coke_img'),
                                                                                           (2, 'Chocolate Shake', 'Beverages', 'Thick chocolate milkshake.', 150.0, true, 'choc_shake'),
                                                                                           (2, 'Chicken Nuggets', 'Sides', 'Crispy fried chicken nuggets (6 pcs).', 130.0, false, 'nuggets_img'),
                                                                                           (2, 'Cheese Slice', 'Addons', 'Extra slice of cheese.', 20.0, true, 'cheese_img'),
                                                                                           (2, 'Soft Serve', 'Desserts', 'Vanilla soft serve ice cream.', 50.0, true, 'soft_serve'),

                                                                                           (4, 'Paneer Tikka Sub', 'Subs', 'Fresh paneer tikka packed in bread.', 210.0, true, 'sub_paneer'),
                                                                                           (4, 'Chicken Teriyaki Sub', 'Subs', 'Glazed chicken in teriyaki sauce.', 250.0, false, 'sub_teriyaki'),
                                                                                           (4, 'Corn & Peas Sub', 'Subs', 'Healthy sweet corn and peas mash.', 180.0, true, 'sub_corn'),
                                                                                           (4, 'Tuna Sub', 'Subs', 'Classic tuna mayo sub.', 260.0, false, 'sub_tuna'),
                                                                                           (4, 'Aloo Patty Sub', 'Subs', 'Spiced potato patty sub.', 160.0, true, 'sub_aloo'),
                                                                                           (4, 'Choc Chip Cookie', 'Desserts', 'Oven baked chocolate chip cookie.', 60.0, true, 'sub_cookie'),
                                                                                           (4, 'Oatmeal Cookie', 'Desserts', 'Healthy oatmeal and raisin cookie.', 60.0, true, 'sub_oat_cookie'),
                                                                                           (4, 'Hash Browns', 'Sides', 'Crispy potato hash browns.', 70.0, true, 'sub_hash'),
                                                                                           (4, 'Iced Tea', 'Beverages', 'Lemon flavored iced tea.', 90.0, true, 'sub_icedtea'),
                                                                                           (4, 'Cold Coffee', 'Beverages', 'Chilled blended coffee.', 120.0, true, 'sub_coldcoffee'),

                                                                                           (5, 'McAloo Tikki Burger', 'Burgers', 'Classic potato and peas patty burger.', 60.0, true, 'mc_aloo'),
                                                                                           (5, 'McChicken Burger', 'Burgers', 'Crispy chicken patty with mayo.', 130.0, false, 'mc_chicken'),
                                                                                           (5, 'Maharaja Mac Veg', 'Burgers', 'Double decker veg burger.', 210.0, true, 'mc_mah_veg'),
                                                                                           (5, 'Maharaja Mac Chicken', 'Burgers', 'Double decker chicken burger.', 240.0, false, 'mc_mah_chick'),
                                                                                           (5, 'Peri Peri Fries', 'Sides', 'Fries tossed in spicy peri peri mix.', 120.0, true, 'mc_peri'),
                                                                                           (5, 'McSpicy Paneer', 'Burgers', 'Spicy paneer patty burger.', 180.0, true, 'mc_paneer'),
                                                                                           (5, 'Chicken McGrill', 'Burgers', 'Grilled chicken burger.', 90.0, false, 'mc_grill'),
                                                                                           (5, 'McFlurry Oreo', 'Desserts', 'Soft serve with crushed oreos.', 110.0, true, 'mc_flurry'),
                                                                                           (5, 'Sprite', 'Beverages', 'Chilled Sprite.', 60.0, true, 'mc_sprite'),
                                                                                           (5, 'Pizza McPuff', 'Sides', 'Crispy puff filled with pizza sauce & cheese.', 55.0, true, 'mc_puff');

-- Cafes / Coffee (Menus 3, 7, 22)
INSERT INTO menu_items (menu_id, name, category, description, price, is_veg, image_id) VALUES
                                                                                           (3, 'Iced Latte', 'Beverages', 'Espresso poured over milk and ice.', 220.0, true, 'iced_latte_img'),
                                                                                           (3, 'Cappuccino', 'Beverages', 'Espresso with steamed milk foam.', 200.0, true, 'cappuccino_img'),
                                                                                           (3, 'Americano', 'Beverages', 'Hot water topped with double espresso.', 180.0, true, 'americano_img'),
                                                                                           (3, 'Mocha', 'Beverages', 'Espresso with chocolate and steamed milk.', 240.0, true, 'mocha_img'),
                                                                                           (3, 'Cold Brew', 'Beverages', 'Slow-steeped cold coffee.', 210.0, true, 'cold_brew_img'),
                                                                                           (3, 'Butter Croissant', 'Food', 'Flaky, buttery french pastry.', 150.0, true, 'croissant_img'),
                                                                                           (3, 'Banana Walnut Cake', 'Food', 'Moist slice of banana bread.', 180.0, true, 'bananacake_img'),
                                                                                           (3, 'Pesto Sandwich', 'Food', 'Grilled sandwich with basil pesto.', 260.0, true, 'pesto_sand'),
                                                                                           (3, 'Pour Over', 'Beverages', 'Manual drip filter coffee.', 220.0, true, 'pourover_img'),
                                                                                           (3, 'Espresso Shot', 'Beverages', 'Single shot of intense coffee.', 120.0, true, 'espresso_img'),

                                                                                           (7, 'Java Chip Frappuccino', 'Beverages', 'Blended coffee with choc chips.', 320.0, true, 'sb_java'),
                                                                                           (7, 'Caramel Macchiato', 'Beverages', 'Vanilla syrup, milk, espresso, and caramel.', 300.0, true, 'sb_caramel'),
                                                                                           (7, 'Vanilla Latte', 'Beverages', 'Latte sweetened with vanilla syrup.', 280.0, true, 'sb_vanilla'),
                                                                                           (7, 'White Mocha', 'Beverages', 'Espresso with white chocolate sauce.', 310.0, true, 'sb_white'),
                                                                                           (7, 'Flat White', 'Beverages', 'Microfoam milk poured over espresso.', 290.0, true, 'sb_flat'),
                                                                                           (7, 'Chilli Cheese Toast', 'Food', 'Toasted bread with melted cheese and chilli.', 200.0, true, 'sb_toast'),
                                                                                           (7, 'New York Cheesecake', 'Food', 'Classic dense and rich baked cheesecake.', 350.0, true, 'sb_cheesecake'),
                                                                                           (7, 'Blueberry Muffin', 'Food', 'Soft muffin bursting with blueberries.', 220.0, true, 'sb_muffin'),
                                                                                           (7, 'Chicken Tikka Sandwich', 'Food', 'Indian spiced chicken in a sandwich.', 320.0, false, 'sb_chicksand'),
                                                                                           (7, 'Green Tea', 'Beverages', 'Calming hot green tea.', 180.0, true, 'sb_green'),

                                                                                           (22, 'Cortado', 'Beverages', 'Equal parts espresso and steamed milk.', 200.0, true, 'tw_cortado'),
                                                                                           (22, 'Sea Salt Mocha', 'Beverages', 'Mocha with a hint of sea salt.', 260.0, true, 'tw_seasalt'),
                                                                                           (22, 'French Press', 'Beverages', 'Coarse ground coffee brewed in a press.', 220.0, true, 'tw_french'),
                                                                                           (22, 'Vietnamese Iced Coffee', 'Beverages', 'Strong coffee with sweetened condensed milk.', 240.0, true, 'tw_viet'),
                                                                                           (22, 'Hot Chocolate', 'Beverages', 'Rich melted chocolate with steamed milk.', 250.0, true, 'tw_hotchoc'),
                                                                                           (22, 'Bagel with Cream Cheese', 'Food', 'Toasted bagel smeared with cream cheese.', 190.0, true, 'tw_bagel'),
                                                                                           (22, 'Almond Croissant', 'Food', 'Croissant filled with almond frangipane.', 210.0, true, 'tw_almond'),
                                                                                           (22, 'Mushroom Quiche', 'Food', 'Savory egg and mushroom tart.', 230.0, true, 'tw_quiche'),
                                                                                           (22, 'Iced Matcha Latte', 'Beverages', 'Matcha green tea poured over milk and ice.', 280.0, true, 'tw_matcha'),
                                                                                           (22, 'Affogato', 'Desserts', 'Vanilla ice cream drowned in espresso.', 240.0, true, 'tw_affogato');

-- Desserts / Bakery (Menus 6, 9, 10, 12, 14, 17, 18, 19)
INSERT INTO menu_items (menu_id, name, category, description, price, is_veg, image_id) VALUES
                                                                                           (6, 'Dense Loaf Cake', 'Cakes', 'Signature chocolate dense loaf.', 400.0, true, 'theo_dense'),
                                                                                           (6, 'Brownie Box', 'Desserts', 'Assorted box of 6 brownies.', 550.0, true, 'theo_brownie'),
                                                                                           (6, 'Red Velvet Cake', 'Cakes', 'Classic red velvet layered with cream cheese.', 600.0, true, 'theo_red'),
                                                                                           (6, 'Pineapple Pastry', 'Pastries', 'Soft sponge soaked in pineapple juice.', 150.0, true, 'theo_pine'),
                                                                                           (6, 'Dutch Truffle', 'Cakes', 'Rich and intense chocolate truffle cake.', 700.0, true, 'theo_dutch'),
                                                                                           (6, 'Mava Cake', 'Cakes', 'Traditional parsi style mava cake.', 250.0, true, 'theo_mava'),
                                                                                           (6, 'Cheese Croissant', 'Bakery', 'Croissant baked with cheddar cheese.', 180.0, true, 'theo_cheese_cro'),
                                                                                           (6, 'Choco Chip Brownie', 'Desserts', 'Classic gooey brownie.', 100.0, true, 'theo_ccb'),
                                                                                           (6, 'Almond Biscotti', 'Bakery', 'Crunchy italian almond cookies.', 300.0, true, 'theo_biscotti'),
                                                                                           (6, 'Lemon Tart', 'Desserts', 'Buttery tart shell filled with lemon curd.', 180.0, true, 'theo_lemon'),

                                                                                           (9, 'Rasgulla', 'Sweets', 'Spongy cottage cheese balls in sugar syrup (2 pcs).', 60.0, true, 'sb_rasgulla'),
                                                                                           (9, 'Mishti Doi', 'Sweets', 'Traditional sweet yoghurt in earthen pot.', 80.0, true, 'sb_doi'),
                                                                                           (9, 'Kheer Kadam', 'Sweets', 'Mini rasgulla coated with khoya.', 70.0, true, 'sb_kheer'),
                                                                                           (9, 'Sondesh', 'Sweets', 'Dry sweet made from fresh paneer.', 50.0, true, 'sb_sondesh'),
                                                                                           (9, 'Cham Cham', 'Sweets', 'Oval shaped Bengali sweet.', 60.0, true, 'sb_cham'),
                                                                                           (9, 'Baked Rasgulla', 'Sweets', 'Rasgulla baked in condensed milk.', 90.0, true, 'sb_baked_ras'),
                                                                                           (9, 'Malai Chop', 'Sweets', 'Paneer sandwich filled with malai.', 75.0, true, 'sb_malai'),
                                                                                           (9, 'Kalo Jam', 'Sweets', 'Dark, rich variation of gulab jamun.', 65.0, true, 'sb_kalo'),
                                                                                           (9, 'Sita Bhog', 'Sweets', 'Sweet vermicelli like dessert with mini jamuns.', 120.0, true, 'sb_sita'),
                                                                                           (9, 'Radha Ballavi', 'Snacks', 'Stuffed puri served with aloo dum.', 110.0, true, 'sb_radha'),

                                                                                           (10, 'Bombay Bhel Chikki', 'Sweets', 'Savoury bhel mixed into sweet chikki.', 250.0, true, 'bss_bhel'),
                                                                                           (10, 'Kaju Katli', 'Sweets', 'Premium cashew fudge.', 300.0, true, 'bss_kaju'),
                                                                                           (10, 'Motichoor Ladoo', 'Sweets', 'Fine besan pearls bound with sugar.', 200.0, true, 'bss_moti'),
                                                                                           (10, 'Ferrero Hazelnut Ladoo', 'Sweets', 'Fusion ladoo with hazelnut center.', 450.0, true, 'bss_ferrero'),
                                                                                           (10, 'Milk Kalakand', 'Sweets', 'Soft, grainy milk cake.', 280.0, true, 'bss_kalakand'),
                                                                                           (10, 'Nankhatai', 'Bakery', 'Traditional Indian shortbread cookies.', 180.0, true, 'bss_nankhatai'),
                                                                                           (10, 'Besan Barfi', 'Sweets', 'Roasted gram flour fudge.', 220.0, true, 'bss_besan'),
                                                                                           (10, 'Pistachio Ghevar', 'Sweets', 'Rajasthani disc shaped sweet topped with pista.', 500.0, true, 'bss_ghevar'),
                                                                                           (10, 'Indulgence Box', 'Sweets', 'Assortment of signature sweets.', 800.0, true, 'bss_box'),
                                                                                           (10, 'Rose Falooda', 'Desserts', 'Chilled rose milk layered with vermicelli & ice cream.', 250.0, true, 'bss_falooda'),

                                                                                           (12, 'Sourdough Loaf', 'Breads', 'Classic crusty sourdough bread.', 250.0, true, 'suchali_sour'),
                                                                                           (12, 'Garlic Focaccia', 'Breads', 'Italian flatbread topped with garlic and herbs.', 200.0, true, 'suchali_foca'),
                                                                                           (12, 'Pain au Chocolat', 'Pastries', 'Flaky pastry filled with chocolate batons.', 180.0, true, 'suchali_pain'),
                                                                                           (12, 'Cinnamon Roll', 'Pastries', 'Soft dough rolled with cinnamon and glazed.', 220.0, true, 'suchali_cinn'),
                                                                                           (12, 'Baguette', 'Breads', 'Classic crusty French stick.', 150.0, true, 'suchali_baguette'),
                                                                                           (12, 'Cruffin', 'Pastries', 'Croissant baked in a muffin tin, filled with cream.', 240.0, true, 'suchali_cruffin'),
                                                                                           (12, 'Wholewheat Loaf', 'Breads', 'Healthy 100% wholewheat sandwich bread.', 120.0, true, 'suchali_ww'),
                                                                                           (12, 'Babka', 'Breads', 'Braided bread swirled with chocolate.', 350.0, true, 'suchali_babka'),
                                                                                           (12, 'Olive Ciabatta', 'Breads', 'Rustic Italian bread dotted with olives.', 180.0, true, 'suchali_olive'),
                                                                                           (12, 'Mushroom Tart', 'Savory', 'Savory tart filled with creamy mushrooms.', 250.0, true, 'suchali_mush'),

                                                                                           (14, 'Zero Sugar Vanilla', 'Ice Cream', 'Guilt-free classic vanilla tub.', 350.0, true, 'gz_vanilla'),
                                                                                           (14, 'Keto Chocolate Tub', 'Ice Cream', 'Low carb rich chocolate ice cream.', 400.0, true, 'gz_choco'),
                                                                                           (14, 'Strawberry Cheesecake Ice Cream', 'Ice Cream', 'Ice cream with cake chunks.', 380.0, true, 'gz_straw'),
                                                                                           (14, 'Vegan Mango Sorbet', 'Ice Cream', 'Dairy-free refreshing mango sorbet.', 300.0, true, 'gz_mango'),
                                                                                           (14, 'Sugar Free Coffee Ice Cream', 'Ice Cream', 'Espresso flavor without the sugar.', 350.0, true, 'gz_coffee'),
                                                                                           (14, 'Protein Ice Cream Bar', 'Ice Cream', 'Choco coated bar with high protein.', 150.0, true, 'gz_bar'),
                                                                                           (14, 'Pistachio Crunch', 'Ice Cream', 'Pista flavored zero sugar ice cream.', 420.0, true, 'gz_pista'),
                                                                                           (14, 'Blueberry Greek Yogurt', 'Desserts', 'Frozen yogurt tub.', 300.0, true, 'gz_yogurt'),
                                                                                           (14, 'Almond Milk Kulfi', 'Ice Cream', 'Traditional kulfi made vegan.', 200.0, true, 'gz_kulfi'),
                                                                                           (14, 'Choco Lava Cake (Diet)', 'Desserts', 'Low cal molten chocolate cake.', 180.0, true, 'gz_lava'),

                                                                                           (17, 'Kesar Peda', 'Sweets', 'Saffron infused milk fudge.', 250.0, true, 'pc_peda'),
                                                                                           (17, 'Dry Fruit Kachori', 'Snacks', 'Crispy shell stuffed with dry fruits and spices.', 150.0, true, 'pc_kachori'),
                                                                                           (17, 'Fafda Jalebi', 'Snacks', 'Classic Sunday breakfast combo.', 180.0, true, 'pc_fafda'),
                                                                                           (17, 'Dhokla', 'Snacks', 'Steamed gram flour savory cake.', 100.0, true, 'pc_dhokla'),
                                                                                           (17, 'Khandvi', 'Snacks', 'Rolled gram flour strips tempered with mustard.', 120.0, true, 'pc_khandvi'),
                                                                                           (17, 'Anjeer Barfi', 'Sweets', 'Fig and nut sugar free sweet.', 350.0, true, 'pc_anjeer'),
                                                                                           (17, 'Malai Peda', 'Sweets', 'Soft, creamy milk peda.', 220.0, true, 'pc_malai'),
                                                                                           (17, 'Samosa (2 pcs)', 'Snacks', 'Crispy pastry stuffed with spiced potatoes.', 50.0, true, 'pc_samosa'),
                                                                                           (17, 'Kachori (2 pcs)', 'Snacks', 'Spiced lentil stuffed crispy snack.', 50.0, true, 'pc_kachori_snack'),
                                                                                           (17, 'Rasmalai', 'Sweets', 'Cottage cheese discs soaked in rabdi.', 90.0, true, 'pc_rasmalai'),

                                                                                           (18, 'Black Forest Cake', 'Cakes', 'Classic chocolate, cherry, and cream cake (500g).', 450.0, true, 'ho_bf'),
                                                                                           (18, 'Pineapple Cake', 'Cakes', 'Vanilla sponge with pineapple chunks (500g).', 400.0, true, 'ho_pine'),
                                                                                           (18, 'Choco Lava', 'Desserts', 'Warm cake with a gooey center.', 90.0, true, 'ho_lava'),
                                                                                           (18, 'Chicken Patties', 'Savory', 'Flaky puff stuffed with minced chicken.', 60.0, false, 'ho_cpatties'),
                                                                                           (18, 'Paneer Patties', 'Savory', 'Flaky puff stuffed with spiced paneer.', 50.0, true, 'ho_ppatties'),
                                                                                           (18, 'Truffle Pastry', 'Pastries', 'Rich chocolate pastry slice.', 80.0, true, 'ho_truffle'),
                                                                                           (18, 'Butterscotch Cake', 'Cakes', 'Caramel and praline cake (500g).', 420.0, true, 'ho_butter'),
                                                                                           (18, 'Strawberry Tart', 'Desserts', 'Tart filled with custard and fresh strawberries.', 120.0, true, 'ho_tart'),
                                                                                           (18, 'Cheese Croissant', 'Savory', 'Savory cheese filled croissant.', 90.0, true, 'ho_croissant'),
                                                                                           (18, 'Garlic Bread Sticks', 'Savory', 'Baked bread sticks with garlic butter.', 110.0, true, 'ho_garlic'),

                                                                                           (19, 'Zebra Torte Cake', 'Cakes', 'Chocolate and vanilla marbled cake.', 500.0, true, 'mon_zebra'),
                                                                                           (19, 'Devil''s Delight', 'Cakes', 'Intense dark chocolate cake.', 550.0, true, 'mon_devil'),
                                                                                           (19, 'Veg Puff', 'Savory', 'Square puff stuffed with mixed veggies.', 30.0, true, 'mon_vpuff'),
                                                                                           (19, 'Chicken Internet Puff', 'Savory', 'Spicy chicken web shaped puff.', 45.0, false, 'mon_cpuff'),
                                                                                           (19, 'Swiss Roll', 'Desserts', 'Sponge cake rolled with jam and cream.', 60.0, true, 'mon_swiss'),
                                                                                           (19, 'Red Velvet Pastry', 'Pastries', 'Slice of red velvet cake.', 90.0, true, 'mon_rv_pas'),
                                                                                           (19, 'Donut', 'Desserts', 'Chocolate glazed ring donut.', 50.0, true, 'mon_donut'),
                                                                                           (19, 'Plum Cake', 'Cakes', 'Fruit and nut loaded dry cake.', 300.0, true, 'mon_plum'),
                                                                                           (19, 'Almond Macaroon', 'Bakery', 'Coconut and almond baked treat.', 80.0, true, 'mon_macaroon'),
                                                                                           (19, 'Paneer Tikka Roll', 'Savory', 'Bread roll stuffed with paneer tikka.', 65.0, true, 'mon_proll');

-- South Indian (Menus 11, 21, 24)
INSERT INTO menu_items (menu_id, name, category, description, price, is_veg, image_id) VALUES
                                                                                           (11, 'Masala Dosa', 'Tiffin', 'Crispy dosa filled with spiced potato mash.', 110.0, true, 'swamy_masala'),
                                                                                           (11, 'Idli Vada Combo', 'Tiffin', '2 Steamed idlis and 1 crispy medu vada.', 90.0, true, 'swamy_idlivada'),
                                                                                           (11, 'Plain Dosa', 'Tiffin', 'Simple thin and crispy crepe.', 70.0, true, 'swamy_plain'),
                                                                                           (11, 'Mysore Masala Dosa', 'Tiffin', 'Dosa coated with spicy red chutney and potato.', 130.0, true, 'swamy_mysore'),
                                                                                           (11, 'Onion Uttappam', 'Tiffin', 'Thick pancake topped with chopped onions.', 120.0, true, 'swamy_uttapam'),
                                                                                           (11, 'Pongal', 'Tiffin', 'Rice and lentil porridge tempered with black pepper and ghee.', 100.0, true, 'swamy_pongal'),
                                                                                           (11, 'Filter Coffee', 'Beverages', 'Authentic South Indian degree coffee.', 50.0, true, 'swamy_coffee'),
                                                                                           (11, 'Kesari Bath', 'Desserts', 'Sweet semolina dessert with ghee and nuts.', 60.0, true, 'swamy_kesari'),
                                                                                           (11, 'Upma', 'Tiffin', 'Savory semolina porridge with veggies.', 70.0, true, 'swamy_upma'),
                                                                                           (11, 'Mini Idlis (14 pcs)', 'Tiffin', 'Bite sized idlis submerged in sambar.', 110.0, true, 'swamy_miniidli'),

                                                                                           (21, 'Chennai Masala Dosa', 'Tiffin', 'Authentic chennai style spicy dosa.', 120.0, true, 'van_masala'),
                                                                                           (21, 'Podi Idli', 'Tiffin', 'Idlis tossed in spicy gunpowder and ghee.', 100.0, true, 'van_podi'),
                                                                                           (21, 'Chettinad Chicken Curry', 'Mains', 'Spicy, peppery chicken curry.', 280.0, false, 'van_chettinad'),
                                                                                           (21, 'Malabar Parotta (2 pcs)', 'Breads', 'Flaky, layered flatbread.', 80.0, true, 'van_parotta'),
                                                                                           (21, 'Mutton Chukka', 'Starters', 'Dry roasted spicy mutton.', 350.0, false, 'van_chukka'),
                                                                                           (21, 'Vegetable Stew', 'Mains', 'Veggies cooked in coconut milk.', 200.0, true, 'van_stew'),
                                                                                           (21, 'Appam (2 pcs)', 'Breads', 'Lace hoppers made from fermented rice batter.', 90.0, true, 'van_appam'),
                                                                                           (21, 'Chicken 65', 'Starters', 'Deep fried spicy chicken chunks.', 250.0, false, 'van_65'),
                                                                                           (21, 'Curd Rice', 'Mains', 'Tempered yogurt mixed with rice.', 130.0, true, 'van_curd'),
                                                                                           (21, 'Payasam', 'Desserts', 'Traditional milk and jaggery dessert.', 80.0, true, 'van_payasam'),

                                                                                           (24, 'Rava Dosa', 'Tiffin', 'Crispy semolina dosa.', 110.0, true, 'bala_rava'),
                                                                                           (24, 'Paper Roast Dosa', 'Tiffin', 'Extra thin, extra large crispy dosa.', 150.0, true, 'bala_paper'),
                                                                                           (24, 'Cheese Masala Dosa', 'Tiffin', 'Masala dosa loaded with grated cheese.', 160.0, true, 'bala_cheese'),
                                                                                           (24, 'Paneer Dosa', 'Tiffin', 'Dosa stuffed with spiced paneer bhurji.', 170.0, true, 'bala_paneer'),
                                                                                           (24, 'Tomato Onion Uttappam', 'Tiffin', 'Thick pancake with tomatoes and onions.', 130.0, true, 'bala_uttapam'),
                                                                                           (24, 'Set Dosa', 'Tiffin', 'Set of 3 soft, spongy dosas.', 110.0, true, 'bala_set'),
                                                                                           (24, 'Ghee Roast Dosa', 'Tiffin', 'Crispy dosa roasted generously in pure ghee.', 140.0, true, 'bala_ghee'),
                                                                                           (24, 'Bisi Bele Bath', 'Mains', 'Spicy rice, lentil, and vegetable mash.', 120.0, true, 'bala_bbb'),
                                                                                           (24, 'Medu Vada (2 pcs)', 'Tiffin', 'Crispy lentil donuts.', 70.0, true, 'bala_vada'),
                                                                                           (24, 'Sweet Lassi', 'Beverages', 'Thick sweetened yogurt drink.', 60.0, true, 'bala_lassi');

-- Indian / Biryani / Meals (Menus 13, 15, 16, 20)
INSERT INTO menu_items (menu_id, name, category, description, price, is_veg, image_id) VALUES
                                                                                           (13, 'Subz-e-Falafel Biryani', 'Biryani', 'Veg biryani with crispy falafel bullets.', 320.0, true, 'vd_falafel'),
                                                                                           (13, 'Zaikedaar Paneer Biryani', 'Biryani', 'Aromatic biryani with paneer tikka.', 350.0, true, 'vd_paneer'),
                                                                                           (13, 'Lazeez Bhuna Murgh Biryani', 'Biryani', 'Spicy bhuna chicken cooked with basmati.', 400.0, false, 'vd_murgh'),
                                                                                           (13, 'Dum Gosht Biryani', 'Biryani', 'Slow cooked mutton biryani.', 550.0, false, 'vd_gosht'),
                                                                                           (13, 'Paneer Tikka Mac & Cheese', 'Fusion', 'Pasta baked with Indian spices.', 280.0, true, 'vd_mac'),
                                                                                           (13, 'Gulab Jamun (1 pc)', 'Desserts', 'Classic sweet treat.', 40.0, true, 'vd_gj'),
                                                                                           (13, 'Mint Raita', 'Sides', 'Cool yogurt with fresh mint.', 50.0, true, 'vd_raita'),
                                                                                           (13, 'Salad', 'Sides', 'Fresh onion and cucumber rings.', 30.0, true, 'vd_salad'),
                                                                                           (13, 'Chicken Tikka', 'Starters', 'Clay oven roasted chicken chunks.', 300.0, false, 'vd_tikka'),
                                                                                           (13, 'Mutton Galouti Kebab', 'Starters', 'Melt in mouth minced mutton kebabs.', 450.0, false, 'vd_galouti'),

                                                                                           (15, 'Chicken Vada Pav', 'Snacks', 'Desi style chicken patty in a bun.', 80.0, false, 'nbc_vadapav'),
                                                                                           (15, 'Butter Chicken Roll', 'Rolls', 'Creamy butter chicken wrapped in a paratha.', 180.0, false, 'nbc_bc_roll'),
                                                                                           (15, 'Chicken Tikka Sandwich', 'Snacks', 'Grilled sandwich with chicken tikka filling.', 150.0, false, 'nbc_sand'),
                                                                                           (15, 'Kheema Pav', 'Meals', 'Spicy minced chicken served with buttered pav.', 220.0, false, 'nbc_kheema'),
                                                                                           (15, 'Chicken Cheese Balls', 'Starters', 'Fried balls stuffed with chicken and cheese.', 160.0, false, 'nbc_balls'),
                                                                                           (15, 'Grilled Chicken Breast', 'Health', 'Herb marinated grilled chicken.', 250.0, false, 'nbc_breast'),
                                                                                           (15, 'Chicken Sausages (4 pcs)', 'Sides', 'Pan fried chicken sausages.', 120.0, false, 'nbc_sausage'),
                                                                                           (15, 'Chicken Salami Pizza', 'Pizzas', 'Thin crust pizza topped with salami.', 280.0, false, 'nbc_pizza'),
                                                                                           (15, 'Crispy Chicken Burger', 'Burgers', 'Fried chicken fillet burger.', 170.0, false, 'nbc_burger'),
                                                                                           (15, 'Diet Coke', 'Beverages', 'Zero calorie cola.', 60.0, true, 'nbc_coke'),

                                                                                           (16, 'Dal Makhani', 'Mains', 'Overnight simmered black lentils.', 240.0, true, 'md_dal'),
                                                                                           (16, 'Butter Chicken', 'Mains', 'Classic creamy tomato gravy chicken.', 350.0, false, 'md_bc'),
                                                                                           (16, 'Paneer Butter Masala', 'Mains', 'Paneer cubes in rich makhani gravy.', 280.0, true, 'md_pbm'),
                                                                                           (16, 'Garlic Naan', 'Breads', 'Tandoori bread topped with garlic.', 60.0, true, 'md_naan'),
                                                                                           (16, 'Tandoori Roti', 'Breads', 'Wholewheat bread baked in clay oven.', 30.0, true, 'md_roti'),
                                                                                           (16, 'Jeera Rice', 'Mains', 'Basmati rice tempered with cumin.', 150.0, true, 'md_jeera'),
                                                                                           (16, 'Mutton Rogan Josh', 'Mains', 'Kashmiri style aromatic mutton curry.', 450.0, false, 'md_rogan'),
                                                                                           (16, 'Palak Paneer', 'Mains', 'Paneer cooked in smooth spinach gravy.', 270.0, true, 'md_palak'),
                                                                                           (16, 'Malai Kofta', 'Mains', 'Cottage cheese dumplings in white gravy.', 290.0, true, 'md_kofta'),
                                                                                           (16, 'Phirni', 'Desserts', 'Ground rice pudding served in clay pot.', 120.0, true, 'md_phirni'),

                                                                                           (20, 'Hyderabadi Chicken Biryani', 'Biryani', 'Spicy dum biryani from Hyderabad.', 290.0, false, 'tbl_hyd'),
                                                                                           (20, 'Lucknowi Mutton Biryani', 'Biryani', 'Mild, aromatic Awadhi biryani.', 400.0, false, 'tbl_luck'),
                                                                                           (20, 'Veg Dum Biryani', 'Biryani', 'Mixed veg biryani sealed with dough.', 250.0, true, 'tbl_veg'),
                                                                                           (20, 'Egg Biryani', 'Biryani', 'Biryani tossed with boiled and fried eggs.', 260.0, false, 'tbl_egg'),
                                                                                           (20, 'Paneer Tikka Biryani', 'Biryani', 'Tandoori paneer layered with basmati.', 280.0, true, 'tbl_paneer'),
                                                                                           (20, 'Chicken 65 Biryani', 'Biryani', 'Spicy fried chicken chunks in biryani.', 310.0, false, 'tbl_65'),
                                                                                           (20, 'Mirchi Ka Salan', 'Sides', 'Spicy peanut and chilli gravy.', 60.0, true, 'tbl_salan'),
                                                                                           (20, 'Burrani Raita', 'Sides', 'Garlic flavored yogurt.', 70.0, true, 'tbl_raita'),
                                                                                           (20, 'Shahi Tukda', 'Desserts', 'Fried bread soaked in sweetened milk.', 110.0, true, 'tbl_shahi'),
                                                                                           (20, 'Thums Up', 'Beverages', 'Strong Indian cola.', 50.0, true, 'tbl_thums');

-- Snacks / Chai / Miscellaneous (Menus 8, 23, 27)
INSERT INTO menu_items (menu_id, name, category, description, price, is_veg, image_id) VALUES
                                                                                           (8, 'Desi Chai', 'Beverages', 'Classic milk tea brewed with tea leaves.', 80.0, true, 'ch_desi'),
                                                                                           (8, 'Adrak Tulsi Chai', 'Beverages', 'Ginger and holy basil tea.', 100.0, true, 'ch_adrak'),
                                                                                           (8, 'Kulhad Chai', 'Beverages', 'Earthy tea served in a clay cup.', 120.0, true, 'ch_kulhad'),
                                                                                           (8, 'Bun Maska', 'Snacks', 'Soft bun slathered with butter.', 70.0, true, 'ch_bun'),
                                                                                           (8, 'Vada Pav', 'Snacks', 'Mumbai''s classic potato slider.', 80.0, true, 'ch_vadapav'),
                                                                                           (8, 'Poha', 'Snacks', 'Flattened rice tempered with peanuts and mustard.', 110.0, true, 'ch_poha'),
                                                                                           (8, 'Maggi', 'Snacks', 'Everyone''s favorite instant noodles.', 90.0, true, 'ch_maggi'),
                                                                                           (8, 'Paneer Pakora', 'Snacks', 'Batter fried cottage cheese.', 140.0, true, 'ch_pakora'),
                                                                                           (8, 'Samosa Chaat', 'Snacks', 'Samosa crushed and topped with chutneys.', 130.0, true, 'ch_samosa'),
                                                                                           (8, 'Filter Coffee', 'Beverages', 'Traditional south indian coffee.', 110.0, true, 'ch_filter'),

                                                                                           (23, 'Kolkata Chicken Roll', 'Rolls', 'Flaky paratha wrapped around spicy chicken.', 120.0, false, 'ras_croll'),
                                                                                           (23, 'Egg Roll', 'Rolls', 'Paratha coated with egg and onions.', 80.0, false, 'ras_eroll'),
                                                                                           (23, 'Mutton Roll', 'Rolls', 'Spicy mutton chunks wrapped in paratha.', 160.0, false, 'ras_mroll'),
                                                                                           (23, 'Paneer Roll', 'Rolls', 'Vegetarian roll with paneer filling.', 110.0, true, 'ras_proll'),
                                                                                           (23, 'Fish Chop (2 pcs)', 'Snacks', 'Bengali style crumb fried fish croquettes.', 140.0, false, 'ras_fish'),
                                                                                           (23, 'Veg Chop', 'Snacks', 'Beetroot and peanut fried croquette.', 60.0, true, 'ras_vegchop'),
                                                                                           (23, 'Mughlai Paratha', 'Meals', 'Deep fried paratha stuffed with egg and minced meat.', 180.0, false, 'ras_mughlai'),
                                                                                           (23, 'Kosha Mangsho', 'Mains', 'Slow cooked rich bengali mutton curry.', 350.0, false, 'ras_kosha'),
                                                                                           (23, 'Luchi (4 pcs)', 'Breads', 'Deep fried puffed bread.', 60.0, true, 'ras_luchi'),
                                                                                           (23, 'Rosogolla (2 pcs)', 'Desserts', 'Classic bengali sweet.', 50.0, true, 'ras_roso');
-- Re-using Generic Snacks for Ashapura (Menu 27 - wait, Ashapura is ID 47251 which is not in my list above. Ah, I picked 25 restaurants, but let's check which menus need filling. We filled 1, 25, 2, 4, 5, 3, 7, 22, 6, 9, 10, 12, 14, 17, 18, 19, 11, 21, 24, 13, 15, 16, 20, 8, 23. That is exactly 25 menus.)
-- Just a quick check to ensure all 25 are filled.
-- Menus 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25. Yes, all 25 menus have 10 items. Total 250 items.

-- ==========================================
-- 5. INSERT 125 REVIEWS (5 per Restaurant)
-- ==========================================
INSERT INTO reviews (restaurant_id, reviewer_name, comment, rating) VALUES
-- 393840 (Chinese Wok)
(393840, 'Neha Singh', 'Amazing authentic Chinese food! Loved the noodles.', 5),
(393840, 'Vikram Patil', 'Good portion sizes but a bit oily.', 4),
(393840, 'Rahul Sharma', 'Delivery was quick, food was hot.', 4),
(393840, 'Anita Desai', 'Dim sums were undercooked.', 2),
(393840, 'Rohan Gupta', 'Best manchow soup in the area.', 5),

-- 552383 (Burger King)
(552383, 'Rohan Gupta', 'Classic Burger King taste, always reliable.', 4),
(552383, 'Priya K', 'Fries were a bit soggy this time.', 3),
(552383, 'Amit Patel', 'Whopper is life. Great packaging.', 5),
(552383, 'Sneha V', 'Missing the extra cheese slice I paid for.', 2),
(552383, 'Karan J', 'Fast delivery and hot burgers.', 5),

-- 718556 (Blue Tokai)
(718556, 'Aarav Mehta', 'Best coffee in Thane! Loved the ambiance.', 5),
(718556, 'Priya K', 'Coffee was great, but delivery was a bit slow.', 4),
(718556, 'Sonali M', 'The pour over coffee is exceptional.', 5),
(718556, 'Deepak S', 'A bit overpriced for everyday coffee.', 3),
(718556, 'Tina R', 'The almond croissant pairs perfectly with the latte.', 5),

-- 10002 (Subway)
(10002, 'Kiran P', 'Fresh veggies and good bread.', 4),
(10002, 'Ravi T', 'They forgot my sauces.', 2),
(10002, 'Maya S', 'Always my go-to for a healthy meal.', 5),
(10002, 'John D', 'Cookies were stale today.', 3),
(10002, 'Simran K', 'Tuna sub is consistently good.', 4),

-- 131601 (McDonald's)
(131601, 'Aditya C', 'McAloo Tikki is a classic.', 5),
(131601, 'Pooja J', 'Fries were cold upon arrival.', 2),
(131601, 'Vijay M', 'Great value for money combos.', 4),
(131601, 'Anil B', 'Peri peri fries were amazing.', 5),
(131601, 'Suresh K', 'Standard taste, no complaints.', 4),

-- 34793 (Theobroma)
(34793, 'Meera W', 'Brownies are out of this world.', 5),
(34793, 'Karan T', 'Dense loaf is worth every penny.', 5),
(34793, 'Gauri N', 'A bit too sweet for my liking.', 3),
(34793, 'Rishabh M', 'Best red velvet in town.', 4),
(34793, 'Alia B', 'Packaging could be better for cakes.', 4),

-- 60181 (Starbucks)
(60181, 'Siddharth P', 'Java chip is my all time favorite.', 5),
(60181, 'Nisha R', 'Too expensive but good treat occasionally.', 4),
(60181, 'Tarun G', 'Wrong name on the cup, but coffee was fine.', 3),
(60181, 'Kavita A', 'Cheesecake was heavenly.', 5),
(60181, 'Manish V', 'Hot coffee was spilled slightly.', 2),

-- 30305 (Chaayos)
(30305, 'Arjun M', 'Adrak chai cures my headache.', 5),
(30305, 'Shruti P', 'Bun maska was fresh and soft.', 5),
(30305, 'Varun K', 'Poha was a bit dry.', 3),
(30305, 'Deepika R', 'Love the kulhad chai experience.', 4),
(30305, 'Harsh S', 'Vada pav is very average.', 2),

-- 10551 (Sweet Bengal)
(10551, 'Bikram C', 'Authentic bengali sweets in Mumbai!', 5),
(10551, 'Anita R', 'Mishti doi is perfectly set.', 5),
(10551, 'Soumya B', 'Rasgullas were very spongy.', 4),
(10551, 'Raj J', 'A bit pricey compared to local shops.', 3),
(10551, 'Sanjay L', 'Baked rasgulla is a must try.', 5),

-- 743390 (Bombay Sweet Shop)
(743390, 'Prateek S', 'Modern twist on classic sweets, love it.', 5),
(743390, 'Diya K', 'Bhel chikki is so innovative and tasty.', 4),
(743390, 'Nitin M', 'Beautiful packaging, great for gifting.', 5),
(743390, 'Kirti V', 'Too sweet for me.', 3),
(743390, 'Akash P', 'Kaju katli melts in the mouth.', 4),

-- 236178 (Swamy)
(236178, 'Anjali Nair', 'Crispiest dosas ever. Highly recommended!', 5),
(236178, 'Rajesh K', 'Sambar is authentic south indian style.', 4),
(236178, 'Madhu S', 'Idlis were a bit hard.', 2),
(236178, 'Kishore V', 'Filter coffee is the best.', 5),
(236178, 'Vani R', 'Good portion size for the price.', 4),

-- 719052 (Suchali's)
(719052, 'Aditi M', 'Sourdough is perfectly crusted.', 5),
(719052, 'Rahul T', 'Croissants are buttery and flaky.', 5),
(719052, 'Sahil B', 'A bit expensive for daily bread.', 3),
(719052, 'Preeti K', 'Cruffin was a revelation!', 4),
(719052, 'Imran H', 'Olive ciabatta was fresh and soft.', 4),

-- 575023 (Veg Darbar)
(575023, 'Smita D', 'Biryani portion is huge.', 4),
(575023, 'Ravi N', 'Paneer was very soft in the biryani.', 5),
(575023, 'Gautam P', 'A bit too much oil for my liking.', 3),
(575023, 'Neha B', 'Raita was missing from my order.', 2),
(575023, 'Pankaj S', 'Excellent flavors and aroma.', 4),

-- 576026 (Go Zero)
(576026, 'Kunal W', 'Cant believe this has no sugar!', 5),
(576026, 'Ritika J', 'Very creamy for a keto ice cream.', 4),
(576026, 'Ankit R', 'Strawberry flavor tasted a bit artificial.', 3),
(576026, 'Megha T', 'Perfect guilt-free dessert.', 5),
(576026, 'Sumeet N', 'A bit icy, needs to be creamier.', 3),

-- 200279 (Nothing but Chicken)
(200279, 'Farhan A', 'Chicken vada pav is genius.', 5),
(200279, 'Zoya F', 'Salads are fresh and filling.', 4),
(200279, 'Naveen K', 'Chicken sausage was undercooked.', 2),
(200279, 'Pallavi M', 'Great protein-packed meals.', 5),
(200279, 'Raghav S', 'Kheema pav was very spicy.', 4),

-- 801203 (Makhani Darbar)
(801203, 'Ashish G', 'Dal makhani is rich and creamy.', 5),
(801203, 'Vinay R', 'Butter chicken is a must try.', 4),
(801203, 'Sonia P', 'Naan became chewy during delivery.', 3),
(801203, 'Ramesh B', 'Authentic punjabi flavors.', 5),
(801203, 'Tina D', 'Quantity is slightly less.', 4),

-- 380341 (Prashant Corner)
(380341, 'Hemant P', 'Best fafda jalebi on Sundays.', 5),
(380341, 'Priti N', 'Dhokla is super soft.', 4),
(380341, 'Ajay V', 'Samosas were cold.', 2),
(380341, 'Sushma K', 'Kesar peda is their specialty.', 5),
(380341, 'Mahesh S', 'Always crowded, but delivery is fast.', 4),

-- 41587 (Hangout Cakes)
(41587, 'Ruchi A', 'Cakes are fresh and reasonably priced.', 4),
(41587, 'Tarun M', 'Chicken patties bring back school memories.', 5),
(41587, 'Nidhi J', 'Truffle pastry was dry.', 2),
(41587, 'Kapil S', 'Good budget bakery.', 4),
(41587, 'Sanjana R', 'Lava cake is perfectly gooey.', 5),

-- 128618 (Monginis)
(128618, 'Ashok T', 'Zebra torte is a classic.', 4),
(128618, 'Vidya P', 'Veg puff was stale.', 2),
(128618, 'Girish L', 'Good for quick birthday cakes.', 4),
(128618, 'Pooja K', 'Swiss roll is my kids favorite.', 5),
(128618, 'Manoj B', 'Standard quality, very consistent.', 3),

-- 186129 (The Biryani Life)
(186129, 'Salman K', 'Hyderabadi biryani lacks punch.', 3),
(186129, 'Aarti D', 'Good flavors, well cooked rice.', 4),
(186129, 'Vivek N', 'Not enough chicken pieces.', 2),
(186129, 'Shreya S', 'Salan was very tasty.', 4),
(186129, 'Nitin B', 'Decent biryani for the price point.', 3),

-- 167187 (Hotel Vanakkam)
(167187, 'Karthik R', 'Appam and stew is brilliant.', 5),
(167187, 'Bala M', 'Chettinad curry is properly spicy.', 5),
(167187, 'Divya S', 'Parottas were too thick.', 3),
(167187, 'Arun V', 'Chicken 65 is crispy and hot.', 4),
(167187, 'Meenakshi K', 'Authentic tamil food in Thane.', 5),

-- 799775 (Third Wave Coffee)
(799775, 'Abhishek M', 'Cortado is brewed to perfection.', 5),
(799775, 'Neha P', 'Ambience is better than delivery.', 3),
(799775, 'Varsha R', 'Bagel was a bit hard.', 2),
(799775, 'Sahil N', 'Sea salt mocha is unique and tasty.', 4),
(799775, 'Ishaan G', 'Great coffee, premium packaging.', 5),

-- 1200310 (Rasobongo)
(1200310, 'Subhasish D', 'Rolls are just like Kolkata.', 5),
(1200310, 'Ananya M', 'Kosha mangsho was very oily.', 3),
(1200310, 'Sourav G', 'Fish chop is highly recommended.', 4),
(1200310, 'Debjani C', 'Luchis were slightly soggy upon arrival.', 3),
(1200310, 'Ritesh P', 'Good bengali street food options.', 4),

-- 299968 (Bala Dosa Plaza)
(299968, 'Kavya S', 'Paper dosa is huge and crispy.', 5),
(299968, 'Rahul N', 'Cheese dosa has generous filling.', 4),
(299968, 'Siddharth V', 'Chutney was spoiled.', 1),
(299968, 'Amrita P', 'Vadas are crisp and not oily.', 5),
(299968, 'Nikhil K', 'Great fast food style dosas.', 4),

-- 392828 (Big Bowl)
(392828, 'Prashant R', 'Bowls are very convenient for office lunch.', 5),
(392828, 'Kriti M', 'Paneer bowl had very little paneer.', 2),
(392828, 'Rajeev S', 'Chicken curry bowl tastes like home.', 4),
(392828, 'Sneha B', 'Good quantity for one person.', 4),
(392828, 'Tushar D', 'Rajma chawal bowl is my daily order.', 5);