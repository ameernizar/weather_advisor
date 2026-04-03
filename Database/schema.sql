CREATE TABLE weather_conditions (
    condition_id INT AUTO_INCREMENT PRIMARY KEY,
    condition_name VARCHAR(50),
    min_temp FLOAT,
    max_temp FLOAT,
    min_rain FLOAT,
    max_rain FLOAT,
    min_humidity INT,
    max_humidity INT,
    min_wind FLOAT,
    max_wind FLOAT,
    min_uv FLOAT,
    max_uv FLOAT,
    priority INT DEFAULT 0,
    is_extreme BOOLEAN DEFAULT 0
);

CREATE TABLE recommendation_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE recommendations (
    recommendation_id INT AUTO_INCREMENT PRIMARY KEY,
    condition_id INT,
    category_id INT,
    recommendation_text VARCHAR(255),

    FOREIGN KEY (condition_id) REFERENCES weather_conditions(condition_id),
    FOREIGN KEY (category_id) REFERENCES recommendation_categories(category_id)
);

CREATE TABLE weather_observations (
    observation_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    country_code CHAR(2),
    observed_at DATETIME NOT NULL,
    temp_c FLOAT,
    feels_like_c FLOAT,
    humidity_pct INT,
    pressure_hpa INT,
    wind_speed_mps FLOAT,
    wind_gust_mps FLOAT,
    wind_deg INT,
    visibility_m INT,
    clouds_pct INT,
    rain_1h_mm FLOAT,
    rain_3h_mm FLOAT,
    snow_1h_mm FLOAT,
    snow_3h_mm FLOAT,
    condition_main VARCHAR(50),
    condition_desc VARCHAR(100),
    uv_index FLOAT,
    lat FLOAT,
    lon FLOAT,
    source VARCHAR(50) DEFAULT 'openweathermap'
);

INSERT INTO weather_conditions
(condition_name, min_temp, max_temp, min_rain, max_rain, min_humidity, max_humidity, min_wind, max_wind, min_uv, max_uv, priority, is_extreme)
VALUES
-- Dry conditions (rain <= 0.4 mm/hr)
('Scorching (Dry)', 40.0, 55.0, 0.0, 0.4, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Hot (Dry)', 32.0, 39.9, 0.0, 0.4, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Warm (Dry)', 24.0, 31.9, 0.0, 0.4, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Mild (Dry)', 16.0, 23.9, 0.0, 0.4, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Cool (Dry)', 8.0, 15.9, 0.0, 0.4, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Cold (Dry)', 0.0, 7.9, 0.0, 0.4, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Freezing (Dry)', -30.0, -0.1, 0.0, 0.4, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),

-- Rain conditions (rain > 0.4 mm/hr)
('Light Rain', -30.0, 55.0, 0.5, 1.9, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Moderate Rain', -30.0, 55.0, 2.0, 9.9, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Heavy Rain', -30.0, 55.0, 10.0, 29.9, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),
('Very Heavy Rain', -30.0, 55.0, 30.0, 200.0, 0, 100, 0.0, 60.0, 0.0, 20.0, 10, 0),

-- Humidity / Wind / UV focused (higher priority)
('High Humidity', 18.0, 35.0, 0.0, 200.0, 75, 100, 0.0, 60.0, 0.0, 20.0, 20, 0),
('Windy', -30.0, 55.0, 0.0, 200.0, 0, 100, 10.0, 19.9, 0.0, 20.0, 20, 0),
('Very Windy', -30.0, 55.0, 0.0, 200.0, 0, 100, 20.0, 60.0, 0.0, 20.0, 25, 0),
('High UV', 20.0, 45.0, 0.0, 1.0, 0, 70, 0.0, 60.0, 8.0, 20.0, 20, 0),

-- Fallback
('Extreme Weather', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);

INSERT INTO recommendation_categories (category_name)
VALUES
('Clothing'),
('Hydration'),
('Skincare'),
('Accessories'),
('Health'),
('Travel'),
('Home'),
('Outdoor'),
('Warning');

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
VALUES
-- Scorching (Dry)
(1, 1, 'Wear loose, light-colored, breathable fabrics'),
(1, 2, 'Drink water regularly; add electrolytes if outside for long'),
(1, 3, 'Use broad-spectrum SPF 30+ and reapply every 2 hours'),
(1, 4, 'Carry UV-blocking sunglasses, a wide-brim hat, and a cooling towel'),
(1, 5, 'Limit strenuous activity during peak afternoon heat'),
(1, 6, 'Plan travel early or late; avoid long walks in direct sun'),
(1, 7, 'Keep rooms shaded and use fans or AC when available'),
(1, 8, 'Choose shaded or indoor activities instead of prolonged outdoor exercise'),
(1, 9, 'Watch for heat exhaustion signs like dizziness, nausea, or headache'),

-- Hot (Dry)
(2, 1, 'Choose lightweight, breathable clothing'),
(2, 2, 'Hydrate frequently; add electrolytes if sweating heavily'),
(2, 3, 'Apply sunscreen to exposed skin'),
(2, 4, 'Carry sunglasses or a cap'),
(2, 5, 'Take breaks in cool places if you feel overheated'),
(2, 6, 'Prefer shorter routes and keep water handy while commuting'),
(2, 7, 'Close curtains during the hottest hours to keep indoor spaces cooler'),
(2, 8, 'Plan outdoor tasks for morning or evening when possible'),
(2, 9, 'Slow down if you notice unusual fatigue or dizziness'),

-- Warm (Dry)
(3, 1, 'Wear light layers for comfort'),
(3, 2, 'Drink water before and during long outdoor activity'),
(3, 3, 'Use sunscreen if you will be outside for extended periods'),
(3, 4, 'Use sunglasses in bright sun'),
(3, 5, 'Take short breaks and avoid overexertion in midday sun'),
(3, 6, 'Conditions are good for travel, but carry water for longer trips'),
(3, 7, 'Let fresh air in if indoor temperatures are comfortable'),
(3, 8, 'Good weather for outdoor exercise; pace yourself in direct sun'),
(3, 9, 'Stay aware of rising heat if the afternoon gets warmer than expected'),

-- Mild (Dry)
(4, 1, 'Light layers or a thin jacket'),
(4, 2, 'Carry a water bottle for longer outings'),
(4, 3, 'Use moisturizer or sunscreen if you have sensitive skin'),
(4, 4, 'Sunglasses can help in bright daylight'),
(4, 5, 'Comfortable conditions for most people; dress in layers if needed'),
(4, 6, 'Travel conditions are generally easy and low stress'),
(4, 7, 'Open windows for fresh air if air quality is good'),
(4, 8, 'Comfortable for walking, errands, and outdoor activities'),
(4, 9, 'Weather is stable, but check for changes before long plans'),

-- Cool (Dry)
(5, 1, 'Wear a light sweater or jacket'),
(5, 2, 'Drink water regularly even if you do not feel very thirsty'),
(5, 3, 'Use lip balm or moisturizer if the air feels dry'),
(5, 4, 'Bring a light scarf or layer for breeze later in the day'),
(5, 5, 'Warm up before outdoor exercise'),
(5, 6, 'Pack an extra layer if you will be out after sunset'),
(5, 7, 'Keep indoor spaces comfortably warm in the evening'),
(5, 8, 'Bring a thin layer for outdoor activity or evening temperatures'),
(5, 9, 'Cool air can feel colder with wind, so dress accordingly'),

-- Cold (Dry)
(6, 1, 'Wear warm layers and a windproof outer layer'),
(6, 2, 'Drink warm fluids and stay hydrated through the day'),
(6, 3, 'Use moisturizer to prevent dry skin'),
(6, 4, 'Wear gloves and a scarf to retain heat'),
(6, 5, 'Limit time outdoors if you are sensitive to cold'),
(6, 6, 'Allow extra travel time and keep warm gear with you'),
(6, 7, 'Keep indoor humidity comfortable and seal drafts if possible'),
(6, 8, 'Choose shorter outdoor sessions and take warming breaks'),
(6, 9, 'Watch for numbness or discomfort if you stay outside too long'),

-- Freezing (Dry)
(7, 1, 'Wear thermal base layers, insulated jacket, and warm socks'),
(7, 2, 'Drink warm fluids regularly to stay hydrated'),
(7, 3, 'Protect exposed skin with moisturizer or barrier cream'),
(7, 4, 'Cover ears, hands, and neck to prevent frostbite'),
(7, 5, 'Watch for frostbite symptoms (numbness, pale skin)'),
(7, 6, 'Drive carefully; black ice risk on shaded roads'),
(7, 7, 'Protect pipes from freezing if applicable'),
(7, 8, 'Avoid long outdoor activity unless properly equipped'),
(7, 9, 'Avoid prolonged outdoor exposure'),

-- Light Rain
(8, 1, 'Carry a light rain jacket or shell'),
(8, 2, 'Drink water as usual; cool rain can hide dehydration'),
(8, 3, 'Use water-resistant skincare and reapply if washed off'),
(8, 4, 'Pack a compact umbrella'),
(8, 5, 'Wear non-slip footwear and take care on slick surfaces'),
(8, 6, 'Allow extra travel time for wet roads'),
(8, 7, 'Keep entryways dry and set out a mat for wet shoes'),
(8, 8, 'Light rain is manageable outdoors with proper gear'),
(8, 9, 'Be careful on stairs, tiles, and painted road markings'),

-- Moderate Rain
(9, 1, 'Wear waterproof outerwear and covered shoes'),
(9, 2, 'Keep a water bottle handy if you are walking with rain gear'),
(9, 3, 'Protect skin from chafing or irritation caused by damp clothing'),
(9, 4, 'Use a sturdy umbrella'),
(9, 5, 'Expect reduced visibility and slower movement outdoors'),
(9, 6, 'Expect slower traffic and reduced visibility'),
(9, 7, 'Keep electronics and documents in waterproof bags'),
(9, 8, 'Outdoor plans are possible, but choose sheltered options'),
(9, 9, 'Avoid waterlogged paths and low-lying areas'),

-- Heavy Rain
(10, 1, 'Full waterproof gear is recommended'),
(10, 2, 'Keep drinking water even if the weather feels cool'),
(10, 3, 'Dry and change damp clothing quickly to avoid skin irritation'),
(10, 4, 'Use rain covers for bags and essentials'),
(10, 5, 'Stay warm and avoid standing in wet clothes for long periods'),
(10, 6, 'Avoid driving through standing water'),
(10, 7, 'Check gutters and drainage around your home'),
(10, 8, 'Postpone non-essential outdoor activity if possible'),
(10, 9, 'Stay updated on local flood advisories'),

-- Very Heavy Rain
(11, 1, 'Wear waterproof boots and a fully sealed rain layer if you must go out'),
(11, 2, 'Keep water and basic supplies ready in case you need to stay indoors longer'),
(11, 3, 'Dry off promptly and protect skin from prolonged dampness'),
(11, 4, 'Use waterproof covers for phones, bags, and important items'),
(11, 5, 'Avoid unnecessary exposure; cold, wet conditions can wear you down quickly'),
(11, 6, 'Delay travel if flooding is possible'),
(11, 7, 'Move valuables away from ground level'),
(11, 8, 'Cancel most outdoor plans until conditions improve'),
(11, 9, 'Follow local alerts and evacuation guidance'),

-- High Humidity
(12, 1, 'Choose moisture-wicking or breathable fabrics'),
(12, 2, 'Hydrate more than usual; sweating may be less effective'),
(12, 3, 'Use light, non-greasy skincare to avoid clogged pores'),
(12, 4, 'Carry a small towel or fan for comfort'),
(12, 5, 'Take breaks in cool or ventilated areas'),
(12, 6, 'Expect travel to feel more tiring; pace yourself and stay cool'),
(12, 7, 'Use a dehumidifier or keep air circulating indoors'),
(12, 8, 'Prefer light outdoor activity and rest often if it feels muggy'),
(12, 9, 'Stop and cool down if you feel faint, overheated, or short of breath'),

-- Windy
(13, 1, 'Wear layers; wind can lower perceived temperature'),
(13, 2, 'Carry water if the dry wind leaves you feeling dehydrated'),
(13, 3, 'Use lip balm or moisturizer to protect against drying wind'),
(13, 4, 'Secure hats and loose accessories'),
(13, 5, 'Protect your eyes and face if dust or debris is blowing around'),
(13, 6, 'Use caution on bridges and open roads'),
(13, 7, 'Secure outdoor items and close loose windows'),
(13, 8, 'Outdoor plans are fine, but choose sheltered areas if gusts increase'),
(13, 9, 'Watch for flying debris and sudden strong gusts'),

-- Very Windy
(14, 1, 'Wear a secure outer layer that will not flap or catch the wind'),
(14, 2, 'Keep water with you, especially if dry winds are irritating'),
(14, 3, 'Protect skin, lips, and eyes from windburn and dryness'),
(14, 4, 'Avoid loose hats and carry only secure accessories'),
(14, 5, 'Take extra care if you have balance or breathing issues outdoors'),
(14, 6, 'Avoid driving high-profile vehicles if possible'),
(14, 7, 'Secure outdoor furniture and loose objects'),
(14, 8, 'Avoid outdoor activities under trees'),
(14, 9, 'Watch for debris and falling branches'),

-- High UV
(15, 1, 'Wear light long sleeves or sun-protective clothing'),
(15, 2, 'Drink extra water when spending time in direct sun'),
(15, 3, 'Apply SPF 30+ and reapply every 2 hours'),
(15, 4, 'Wear sunglasses and a wide-brim hat'),
(15, 5, 'Protect children and sensitive skin'),
(15, 6, 'Plan travel to reduce time in direct afternoon sun'),
(15, 7, 'Close blinds or use shade indoors where sunlight is intense'),
(15, 8, 'Seek shade during peak sun hours'),
(15, 9, 'Limit midday exposure if UV warnings are unusually high'),

-- Extreme
(16, 1, 'Wear the most protective clothing available for the conditions'),
(16, 2, 'Keep drinking water and emergency supplies ready'),
(16, 3, 'Protect exposed skin from sun, cold, or wind as needed'),
(16, 4, 'Keep essential accessories ready, including lights, chargers, and protective gear'),
(16, 5, 'Avoid going outside unless necessary'),
(16, 6, 'Delay travel until official guidance says it is safer'),
(16, 7, 'Secure your home and keep emergency essentials accessible'),
(16, 8, 'Cancel outdoor plans and move activities indoors'),
(16, 9, 'Follow official weather alerts and advisories');
