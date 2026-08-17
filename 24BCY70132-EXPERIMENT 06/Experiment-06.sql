CREATE TABLE Sales
(
    sale_date DATE,
    fruit VARCHAR(20),
    sold_num INT,

    PRIMARY KEY (sale_date, fruit)
);

INSERT INTO Sales
VALUES
('2020-05-01','apples',10),
('2020-05-01','oranges',8),

('2020-05-02','apples',15),
('2020-05-02','oranges',15),

('2020-05-03','apples',20),
('2020-05-03','oranges',0),

('2020-05-04','apples',15),
('2020-05-04','oranges',16);


SELECT 
SALE_DATE,
SUM(CASE WHEN fruit='apples' then sold_num else -sold_num end)AS DIFFERENCE
FROM sales
Group by sale_date
order by sale_date;


--B
CREATE TABLE Tree
(
    id INT PRIMARY KEY,
    p_id INT
);

INSERT INTO Tree
VALUES
(1, NULL),
(2,1),
(3,1),
(4,2),
(5,2);

SELECT
    t.id,
    CASE
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN NOT EXISTS (
            SELECT 1
            FROM tree c
            WHERE c.p_id = t.id
        ) THEN 'Leaf'
        ELSE 'Inner'
    END AS Type
FROM tree t
ORDER BY t.id;

