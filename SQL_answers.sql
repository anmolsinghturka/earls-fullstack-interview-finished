-- Question #1
-- Based on the ERD provided, write a SQL query to find the number of occurrences that an ingredient named “Lobster Ravioli” was sold at each store. Rank the stores by dishes sold with the highest occurrence first.

select store.store_id, count(sales.ingredient_id) as num_of_occurences from store,sales,ingredient where sales.store_id= store.store_id and sales.ingredient_id = ingredient.ingredient_id and ingredient.ingredient_name ='Lobster Ravioli' group by sales.store_id order by count(sales.ingredient_id) desc; 

-- Question #2
-- Revise the query from Question #1 to limit the dataset queried between April 1st, 2021 to May 1st, 2021. Return only the stores that have sold more than 45 Lobster Ravioli dishes.

select store.store_id, count(sales.ingredient_id) as num_of_occurences from store,sales,ingredient where sales.store_id= store.store_id and sales.ingredient_id = ingredient.ingredient_id and ingredient.ingredient_name ='Lobster Ravioli' and count(sales.ingredient_id) > 45 and sales.business_date >= '2021/04/01' and sales.business_date <= '2021/05/01' group by sales.store_id order by count(sales.ingredient_id) desc; 

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

-- Everything is fine as all the tables are already normalized