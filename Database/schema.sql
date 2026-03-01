CREATE TABLE weather_conditions (
    condition_id INT AUTO_INCREMENT PRIMARY KEY,
    condition_name VARCHAR(50),
    min_temp FLOAT,
    max_temp FLOAT,
    min_rain FLOAT,
    max_rain FLOAT,
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

INSERT INTO weather_conditions 
(condition_name, min_temp, max_temp, min_rain, max_rain, is_extreme)
VALUES
('Hot', 30, 50, 0, 2, 0),
('Rainy', 20, 35, 2, 100, 0),
('Cold', 0, 20, 0, 2, 0),
('Extreme Weather', NULL, NULL, NULL, NULL, 1);

INSERT INTO recommendation_categories (category_name)
VALUES
('Clothing'),
('Skincare'),
('Accessories'),
('Warning');

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
VALUES
-- Hot
(1, 1, 'Wear light cotton clothes'),
(1, 2, 'Use sunscreen'),
(1, 3, 'Carry sunglasses'),

-- Rainy
(2, 1, 'Wear waterproof clothing'),
(2, 3, 'Carry an umbrella'),

-- Cold
(3, 1, 'Wear warm clothes'),
(3, 2, 'Use moisturizer'),

-- Extreme
(4, 4, 'Avoid going outside'),
(4, 4, 'Follow weather alerts');