USE RecipesExample;

#	“Show me the main course recipes and list all the ingredients.”
SELECT * FROM RECIPE_CLASSES;
SELECT * FROM INGREDIENTS;


SELECT RecipeTitle, IngredientName
FROM RECIPES
INNER JOIN RECIPE_INGREDIENTS
ON RECIPE_INGREDIENTS.RecipeID = RECIPES.RecipeID
INNER JOIN INGREDIENTS
ON INGREDIENTS.IngredientID = RECIPE_INGREDIENTS.IngredientID
INNER JOIN RECIPE_CLASSES
ON RECIPE_CLASSES.RecipeClassID = RECIPES.RecipeClassID
WHERE Recipe_Classes.RecipeClassDescription = 'Main course';

#	“Display all the ingredients for recipes that contain carrots.”
SELECT RecipeTitle, IngredientName
FROM RECIPES
WHERE IngredientName = 'Carrot';


#	“Show me customers and employees who have the same name.”
#	“Find all the customers who ordered a bicycle and also ordered a helmet.”
#	“List the entertainers who played engagements for customers Bonnicksen and Rosales.”
#	“Show me the students who have an average score of 85 or better in Art and who also have an average score of 85 or better in Computer Science.”
#	“Find the bowlers who had a raw score of 155 or better at both Thunderbird Lanes and Bolero Lanes.”
#	“Show me the recipes that have beef and garlic.
#	“I need the recipe type, recipe name, preparation instructions, ingredient names, ingredient step numbers, 
#	ingredient quantities, and ingredient measurements from my recipes database, sorted in step number sequence.”
SELECT Recipe_Classes.RecipeClassDescription,
Recipes.RecipeTitle, Recipes.Preparation,
Ingredients.IngredientName,
Recipe_Ingredients.RecipeSeqNo,
Recipe_Ingredients.Amount,
Measurements.MeasurementDescription
FROM (
		(
			(Recipe_Classes
			INNER JOIN Recipes
			ON Recipe_Classes.RecipeClassID =
			Recipes.RecipeClassID)
				INNER JOIN Recipe_Ingredients
				ON Recipes.RecipeID =
				Recipe_Ingredients.RecipeID)
					INNER JOIN Ingredients
					ON Ingredients.IngredientID =
					Recipe_Ingredients.IngredientID)
						INNER JOIN Measurements
						ON Measurements.MeasureAmountID =
						Recipe_Ingredients.MeasureAmountID
ORDER BY RecipeTitle, RecipeSeqNo;




SELECT * FROM Recipe_Classes;

SELECT RC.RecipeTitle, RC.Preparation, RC.Notes
FROM Recipes as RC
NATURAL JOIN Recipe_Classes
WHERE RecipeClassDescription = 'Main course' 
OR RecipeClassDescription = 'Dessert';


SELECT R.RecipeTitle, R.Preparation,
RCFiltered.ClassName
FROM (
SELECT RecipeClassID, RecipeClassDescription AS ClassName
FROM Recipe_Classes AS RC
WHERE RC.RecipeClassDescription = 'Main course' OR
RC.RecipeClassDescription = 'Dessert') AS RCFiltered
INNER JOIN Recipes AS R
ON RCFiltered.RecipeClassID = R.RecipeClassID;


SELECT RecipeTitle
FROM Recipes
WHERE MeatIngredient = 'Beef'
AND VegetableIngredient = 'Onions';

#	“List the recipes that have no notes.”
SELECT RecipeTitle
FROM Recipes
WHERE Notes IS NULL;

#	“Show the ingredients that are meats (ingredient class is 2) but that aren’t chicken.”


