START TRANSACTION;

DELETE FROM recommendations;

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear loose, light-colored, breathable fabrics'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Drink water regularly; add electrolytes if outside for long'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use broad-spectrum SPF 30+ and reapply every 2 hours'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Carry UV-blocking sunglasses, a wide-brim hat, and a cooling towel'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Limit strenuous activity during peak afternoon heat'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Plan travel early or late; avoid long walks in direct sun'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep rooms shaded and use fans or AC when available'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Choose shaded or indoor activities instead of prolonged outdoor exercise'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Watch for heat exhaustion signs like dizziness, nausea, or headache'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Scorching (Dry)' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Choose lightweight, breathable clothing'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Hydrate frequently; add electrolytes if sweating heavily'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Apply sunscreen to exposed skin'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Carry sunglasses or a cap'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Take breaks in cool places if you feel overheated'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Prefer shorter routes and keep water handy while commuting'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Close curtains during the hottest hours to keep indoor spaces cooler'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Plan outdoor tasks for morning or evening when possible'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Slow down if you notice unusual fatigue or dizziness'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Hot (Dry)' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear light layers for comfort'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Drink water before and during long outdoor activity'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use sunscreen if you will be outside for extended periods'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use sunglasses in bright sun'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Take short breaks and avoid overexertion in midday sun'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Conditions are good for travel, but carry water for longer trips'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Let fresh air in if indoor temperatures are comfortable'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Good weather for outdoor exercise; pace yourself in direct sun'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Stay aware of rising heat if the afternoon gets warmer than expected'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Warm (Dry)' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Light layers or a thin jacket'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Carry a water bottle for longer outings'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use moisturizer or sunscreen if you have sensitive skin'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Sunglasses can help in bright daylight'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Comfortable conditions for most people; dress in layers if needed'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Travel conditions are generally easy and low stress'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Open windows for fresh air if air quality is good'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Comfortable for walking, errands, and outdoor activities'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Weather is stable, but check for changes before long plans'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Mild (Dry)' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear a light sweater or jacket'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Drink water regularly even if you do not feel very thirsty'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use lip balm or moisturizer if the air feels dry'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Bring a light scarf or layer for breeze later in the day'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Warm up before outdoor exercise'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Pack an extra layer if you will be out after sunset'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep indoor spaces comfortably warm in the evening'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Bring a thin layer for outdoor activity or evening temperatures'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Cool air can feel colder with wind, so dress accordingly'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cool (Dry)' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear warm layers and a windproof outer layer'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Drink warm fluids and stay hydrated through the day'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use moisturizer to prevent dry skin'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear gloves and a scarf to retain heat'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Limit time outdoors if you are sensitive to cold'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Allow extra travel time and keep warm gear with you'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep indoor humidity comfortable and seal drafts if possible'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Choose shorter outdoor sessions and take warming breaks'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Watch for numbness or discomfort if you stay outside too long'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Cold (Dry)' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear thermal base layers, insulated jacket, and warm socks'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Drink warm fluids regularly to stay hydrated'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Protect exposed skin with moisturizer or barrier cream'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Cover ears, hands, and neck to prevent frostbite'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Watch for frostbite symptoms (numbness, pale skin)'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Drive carefully; black ice risk on shaded roads'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Protect pipes from freezing if applicable'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid long outdoor activity unless properly equipped'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid prolonged outdoor exposure'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Freezing (Dry)' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Carry a light rain jacket or shell'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Drink water as usual; cool rain can hide dehydration'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use water-resistant skincare and reapply if washed off'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Pack a compact umbrella'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear non-slip footwear and take care on slick surfaces'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Allow extra travel time for wet roads'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep entryways dry and set out a mat for wet shoes'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Light rain is manageable outdoors with proper gear'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Be careful on stairs, tiles, and painted road markings'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Light Rain' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear waterproof outerwear and covered shoes'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep a water bottle handy if you are walking with rain gear'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Protect skin from chafing or irritation caused by damp clothing'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use a sturdy umbrella'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Expect reduced visibility and slower movement outdoors'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Expect slower traffic and reduced visibility'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep electronics and documents in waterproof bags'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Outdoor plans are possible, but choose sheltered options'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid waterlogged paths and low-lying areas'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Moderate Rain' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Full waterproof gear is recommended'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep drinking water even if the weather feels cool'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Dry and change damp clothing quickly to avoid skin irritation'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use rain covers for bags and essentials'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Stay warm and avoid standing in wet clothes for long periods'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid driving through standing water'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Check gutters and drainage around your home'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Postpone non-essential outdoor activity if possible'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Stay updated on local flood advisories'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Heavy Rain' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear waterproof boots and a fully sealed rain layer if you must go out'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep water and basic supplies ready in case you need to stay indoors longer'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Dry off promptly and protect skin from prolonged dampness'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use waterproof covers for phones, bags, and important items'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid unnecessary exposure; cold, wet conditions can wear you down quickly'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Delay travel if flooding is possible'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Move valuables away from ground level'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Cancel most outdoor plans until conditions improve'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Follow local alerts and evacuation guidance'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Heavy Rain' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Choose moisture-wicking or breathable fabrics'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Hydrate more than usual; sweating may be less effective'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use light, non-greasy skincare to avoid clogged pores'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Carry a small towel or fan for comfort'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Take breaks in cool or ventilated areas'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Expect travel to feel more tiring; pace yourself and stay cool'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use a dehumidifier or keep air circulating indoors'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Prefer light outdoor activity and rest often if it feels muggy'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Stop and cool down if you feel faint, overheated, or short of breath'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High Humidity' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear layers; wind can lower perceived temperature'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Carry water if the dry wind leaves you feeling dehydrated'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use lip balm or moisturizer to protect against drying wind'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Secure hats and loose accessories'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Protect your eyes and face if dust or debris is blowing around'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Use caution on bridges and open roads'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Secure outdoor items and close loose windows'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Outdoor plans are fine, but choose sheltered areas if gusts increase'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Watch for flying debris and sudden strong gusts'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Windy' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear a secure outer layer that will not flap or catch the wind'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep water with you, especially if dry winds are irritating'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Protect skin, lips, and eyes from windburn and dryness'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid loose hats and carry only secure accessories'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Take extra care if you have balance or breathing issues outdoors'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid driving high-profile vehicles if possible'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Secure outdoor furniture and loose objects'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid outdoor activities under trees'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Watch for debris and falling branches'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Very Windy' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear light long sleeves or sun-protective clothing'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Drink extra water when spending time in direct sun'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Apply SPF 30+ and reapply every 2 hours'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear sunglasses and a wide-brim hat'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Protect children and sensitive skin'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Plan travel to reduce time in direct afternoon sun'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Close blinds or use shade indoors where sunlight is intense'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Seek shade during peak sun hours'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Limit midday exposure if UV warnings are unusually high'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'High UV' AND rc.category_name = 'Warning';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Wear the most protective clothing available for the conditions'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Clothing';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep drinking water and emergency supplies ready'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Hydration';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Protect exposed skin from sun, cold, or wind as needed'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Skincare';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Keep essential accessories ready, including lights, chargers, and protective gear'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Accessories';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Avoid going outside unless necessary'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Health';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Delay travel until official guidance says it is safer'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Travel';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Secure your home and keep emergency essentials accessible'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Home';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Cancel outdoor plans and move activities indoors'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Outdoor';

INSERT INTO recommendations (condition_id, category_id, recommendation_text)
SELECT wc.condition_id, rc.category_id, 'Follow official weather alerts and advisories'
FROM weather_conditions wc
JOIN recommendation_categories rc
WHERE wc.condition_name = 'Extreme Weather' AND rc.category_name = 'Warning';

COMMIT;
