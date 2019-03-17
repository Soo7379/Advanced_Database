/* Drop everything here */
DROP TABLE COMP214_Ingredients CASCADE CONSTRAINTS;
DROP TABLE COMP214_Recipes CASCADE CONSTRAINTS;
DROP TABLE COMP214_Categories CASCADE CONSTRAINTS;
DROP TABLE COMP214_Cuisines CASCADE CONSTRAINTS;
DROP TABLE COMP214_ErrorLog CASCADE CONSTRAINTS;
DROP SEQUENCE Recipes_RecipeID_seq;
DROP SEQUENCE Ingredients_IngredientID_seq;
DROP SEQUENCE Categories_CategoryID_seq;
DROP SEQUENCE Cuisines_CuisineID_seq;
DROP SEQUENCE ErrorLog_ErrorLogID_seq;
DROP INDEX Recipes_CategoryType_idx;
DROP INDEX Recipes_Cuisine_idx;
DROP INDEX Recipes_DateEntered_idx;
DROP PROCEDURE COMP214_Insert_Recipe;
DROP PROCEDURE COMP214_Delete_Recipe;
DROP PROCEDURE COMP214_Update_Recipe;
DROP PROCEDURE COMP214_Insert_Ingredient;
DROP FUNCTION COMP214_Recipe_Deleted;
DROP FUNCTION COMP214_Recipe_Updated;
DROP TRIGGER InappropriateWord_trg;

/* Create tables */
CREATE TABLE COMP214_Recipes(
  RecipeID NUMBER(7) NOT NULL,
  RecipeName VARCHAR2(50),
  SubmittedBy VARCHAR2(20),
  CategoryType VARCHAR2(20),
  CookingTime VARCHAR2(20),
  Servings NUMBER(3) NOT NULL,
  Cuisine VARCHAR2(20),
  Description VARCHAR2(300) NOT NULL,
  DateEntered DATE DEFAULT SYSDATE,
  CONSTRAINT recipe_id_pk PRIMARY KEY(RecipeID)
  );
CREATE TABLE COMP214_Ingredients(
  IngredientID NUMBER(7) NOT NULL,
  RecipeID NUMBER(7),
  Name VARCHAR2(20) NOT NULL,
  Quantity NUMBER(3),
  UnitOfMeasure VARCHAR2(20),
  CONSTRAINT ingredient_id_pk PRIMARY KEY(IngredientID)
  );  
CREATE TABLE COMP214_Categories(
  CategoryID NUMBER(7),
  CategoryType VARCHAR2(20),
  CONSTRAINT category_id_pk PRIMARY KEY(CategoryID)
  );
CREATE TABLE COMP214_Cuisines(
  CuisineID NUMBER(7),
  CuisineType VARCHAR2(20),
  CONSTRAINT Cuisine_id_pk PRIMARY KEY(CuisineID)
  );
CREATE TABLE COMP214_ErrorLog(
  ErrorLogID NUMBER(7),
  ErrorTime DATE DEFAULT SYSDATE,
  ErrorName VARCHAR2(50),
  CONSTRAINT errorLog_id_pk PRIMARY KEY(ErrorLogID)
  );
/* Create sequences */
CREATE SEQUENCE Recipes_RecipeID_seq
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE Ingredients_IngredientID_seq
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE Categories_CategoryID_seq
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE Cuisines_CuisineID_seq
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE ErrorLog_ErrorLogID_seq
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

/* Create sequences */
CREATE INDEX Recipes_CategoryType_idx
ON COMP214_Recipes(CategoryType);
CREATE INDEX Recipes_Cuisine_idx
ON COMP214_Recipes(Cuisine);
CREATE INDEX Recipes_DateEntered_idx
ON COMP214_Recipes(DateEntered);

/* Create trigger */
CREATE OR REPLACE TRIGGER InappropriateWord_trg
  AFTER INSERT ON COMP214_Recipes
DECLARE
  lv_latestRecipeID COMP214_Recipes.RecipeID%TYPE;
  lv_latestSubmittedBy COMP214_Recipes.SubmittedBy%TYPE;
BEGIN
  SELECT MAX(RecipeID) 
    INTO lv_latestRecipeID
    FROM COMP214_Recipes;
  SELECT SubmittedBy
    INTO lv_latestSubmittedBy
    FROM COMP214_Recipes
    WHERE RecipeID = lv_latestRecipeID;
  IF (lv_latestSubmittedBy = 'fuck') THEN
    UPDATE COMP214_Recipes
      SET SubmittedBy = 'Bad Word'
      WHERE RecipeID = lv_latestRecipeID;
    INSERT INTO COMP214_ErrorLog VALUES(ErrorLog_ErrorLogID_seq.NEXTVAL,
                                        SYSDATE, 'Inappropriate Word');
  END IF;
END;

/* Create Procedures */
CREATE OR REPLACE
PROCEDURE COMP214_Insert_Recipe
  (RecipeName IN VARCHAR2,
  SubmittedBy IN VARCHAR2,
  in_CategoryID IN NUMBER,
  CookingTime IN VARCHAR2,
  Servings IN NUMBER,
  in_CuisineID IN NUMBER,
  Description IN VARCHAR2)
AS
  p_CategoryType COMP214_Categories.CategoryType%TYPE;
  p_CuisineType COMP214_Cuisines.CuisineType%TYPE;
BEGIN
  SELECT CategoryType
    INTO p_CategoryType 
    FROM COMP214_Categories
    WHERE CategoryID = in_CategoryID;
  SELECT CuisineType
    INTO p_CuisineType
    FROM COMP214_Cuisines
    WHERE CuisineID = in_CuisineID;
  INSERT INTO COMP214_Recipes VALUES (Recipes_RecipeID_seq.NEXTVAL, RecipeName,
                                      SubmittedBy, p_CategoryType, 
                                      CookingTime, Servings, p_CuisineType, 
                                      Description, SYSDATE);
  COMMIT;
END;

CREATE OR REPLACE
PROCEDURE COMP214_Update_Recipe
  (p_RecipeID IN NUMBER,
  p_SubmittedBy IN VARCHAR2,
  in_CategoryID IN NUMBER,
  p_CookingTime IN VARCHAR2,
  p_Servings IN NUMBER,
  in_CuisineID IN NUMBER,
  p_Description IN VARCHAR2)
AS
  p_CategoryType COMP214_Categories.CategoryType%TYPE;
  p_CuisineType COMP214_Cuisines.CuisineType%TYPE;
  p_message VARCHAR2(100);
BEGIN
  SELECT CategoryType
    INTO p_CategoryType 
    FROM COMP214_Categories
    WHERE CategoryID = in_CategoryID;
  SELECT CuisineType
    INTO p_CuisineType
    FROM COMP214_Cuisines
    WHERE CuisineID = in_CuisineID;
  UPDATE COMP214_Recipes
    SET SubmittedBy = p_SubmittedBy,
      CategoryType = p_CategoryType,
      CookingTime = p_CookingTime,
      Servings = p_Servings,
      Cuisine = p_CuisineType,
      Description = p_Description
    WHERE RecipeID = p_RecipeID;
  p_message := COMP214_Recipe_Updated(p_RecipeID);
  DBMS_OUTPUT.PUT_LINE(p_message);
  COMMIT;
END;

CREATE OR REPLACE
PROCEDURE COMP214_Insert_Ingredient
  (RecipeID IN NUMBER,
  Name IN VARCHAR2,
  Quantity IN NUMBER,
  UnitOfMeasure IN VARCHAR2)
AS
BEGIN
  INSERT INTO COMP214_Ingredients VALUES (Ingredients_IngredientID_seq.NEXTVAL, Name,
                                          RecipeID, Quantity, UnitOfMeasure);
END;

CREATE OR REPLACE
PROCEDURE COMP214_Delete_Recipe
  (Recipe_ID IN NUMBER)
AS
  p_message VARCHAR2(50);
BEGIN
  DELETE FROM COMP214_Recipes 
  WHERE Recipe_ID = RecipeID;
  p_message := COMP214_Recipe_Deleted(Recipe_ID);
  DBMS_OUTPUT.PUT_LINE(p_message);
  COMMIT;
END;

/* Inserts to populate the categories and cuisines table in order to populate the drop down lists */
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Appetizers');
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Bread');
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Cakes');
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Desserts');
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Grilling');
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Pasta');
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Pie');
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Sandwiches');
INSERT INTO COMP214_Categories VALUES(Categories_CategoryID_seq.NEXTVAL,'Soups');
INSERT INTO COMP214_Cuisines VALUES(Cuisines_CuisineID_seq.NEXTVAL,'Mexican');
INSERT INTO COMP214_Cuisines VALUES(Cuisines_CuisineID_seq.NEXTVAL,'Italian');
INSERT INTO COMP214_Cuisines VALUES(Cuisines_CuisineID_seq.NEXTVAL,'Indian');
INSERT INTO COMP214_Cuisines VALUES(Cuisines_CuisineID_seq.NEXTVAL,'Thai');
INSERT INTO COMP214_Cuisines VALUES(Cuisines_CuisineID_seq.NEXTVAL,'Greek');
INSERT INTO COMP214_Cuisines VALUES(Cuisines_CuisineID_seq.NEXTVAL,'Chinese');
INSERT INTO COMP214_Cuisines VALUES(Cuisines_CuisineID_seq.NEXTVAL,'Korean');
INSERT INTO COMP214_Cuisines VALUES(Cuisines_CuisineID_seq.NEXTVAL,'Japanese');

/* Create Functions */
CREATE OR REPLACE
FUNCTION COMP214_Recipe_Deleted
  (RecipeID IN NUMBER)
  RETURN VARCHAR2
AS
  f_message VARCHAR2(50);
BEGIN
  IF (RecipeID > Recipes_RecipeID_seq.NEXTVAL OR RecipeID < 1) THEN
    f_message := 'Invalid RecipeID attempted deletion';
  ELSE
    f_message := 'Valid RecipeID attempted deletion';
  END IF;
  RETURN f_message;
END;

CREATE OR REPLACE
FUNCTION COMP214_Recipe_Updated
  (RecipeID IN NUMBER)
  RETURN VARCHAR2
AS
  f_message VARCHAR2(100);
BEGIN
  IF (RecipeID > Recipes_RecipeID_seq.NEXTVAL OR RecipeID < 1) THEN
    f_message := 'Invalid RecipeID attempted to be updated';
  ELSE
    f_message := 'Valid RecipeID attempted to be updated';
  END IF;
  RETURN f_message;
END;