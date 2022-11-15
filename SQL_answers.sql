-- Question #1
-- Based on the ERD provided, write a SQL query to find the number of occurrences that an ingredient named “Lobster Ravioli” was sold at each store. Rank the stores by dishes sold with the highest occurrence first.

SELECT store.store_id, COUNT(sales.ingredient_id) AS num_of_occurences FROM store, sales, ingredient WHERE sales.store_id = store.store_id AND sales.ingredient_id = ingredient.ingredient_id AND ingredient.ingredient_name ='Lobster Ravioli' GROUP BY sales.store_id ORDER BY COUNT(sales.ingredient_id) DESC; 

-- Question #2
-- Revise the query from Question #1 to limit the dataset queried between April 1st, 2021 to May 1st, 2021. Return only the stores that have sold more than 45 Lobster Ravioli dishes.

SELECT store.store_id, COUNT(sales.ingredient_id) AS num_of_occurences FROM store,sales,ingredient WHERE sales.store_id= store.store_id AND sales.ingredient_id = ingredient.ingredient_id AND ingredient.ingredient_name ='Lobster Ravioli' AND COUNT(sales.ingredient_id) > 45 AND sales.business_date >= '2021/04/01' AND sales.business_date <= '2021/05/01' GROUP BY sales.store_id ORDER BY COUNT(sales.ingredient_id) DESC; 

-- Question #3
-- Referencing the Sales table, write the corresponding `CREATE` SQL DDL statement. Include and provide justification for any improvements or add-ons as you see fit.

CREATE TABLE Sales (
    sale_id int NOT NULL,
    ingredient_id int ,
    business_date date NOT NULL,
    sold_price float NOT NULL,
    store_id int,
    PRIMARY KEY (sale_id),
    FOREIGN KEY (store_id) REFERENCES Store(store_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
);

{# All the tables are already normalized no additions are needed. #}
