CREATE TABLE recipes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    prep_time INT,
    cook_time INT,
    published DATE,
    category TEXT,
    servings TEXT,
    owner UUID
);

CREATE TABLE images (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    recipe_id UUID REFERENCES recipes(id),
    image TEXT
);

CREATE TABLE ingredients (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    recipe_id UUID REFERENCES recipes(id),
    ingredient TEXT,
    quantity TEXT
);

CREATE TABLE instructions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    recipe_id UUID REFERENCES recipes(id),
    step INT,
    description TEXT
);

CREATE TABLE nutrition (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    recipe_id UUID UNIQUE REFERENCES recipes(id),
    calories DECIMAL,
    fat DECIMAL,
    saturated_fat DECIMAL,
    cholesterol DECIMAL,
    sodium DECIMAL,
    carbohydrates DECIMAL,
    fiber DECIMAL,
    sugar DECIMAL,
    protein DECIMAL
);

-- Enable RLS for all tables
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;
ALTER TABLE images ENABLE ROW LEVEL SECURITY;
ALTER TABLE ingredients ENABLE ROW LEVEL SECURITY;
ALTER TABLE instructions ENABLE ROW LEVEL SECURITY;
ALTER TABLE nutrition ENABLE ROW LEVEL SECURITY;

-- Allow read access for all users for all tables
CREATE POLICY recipes_select_policy
  ON recipes
  FOR SELECT
  USING (true);

CREATE POLICY images_select_policy
  ON images
  FOR SELECT
  USING (true);

CREATE POLICY ingredients_select_policy
  ON ingredients
  FOR SELECT
  USING (true);

CREATE POLICY instructions_select_policy
  ON instructions
  FOR SELECT
  USING (true);

CREATE POLICY nutrition_select_policy
  ON nutrition
  FOR SELECT
  USING (true);
