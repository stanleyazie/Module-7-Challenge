--Count the transactions that are less than $2.00 per cardholder.
CREATE VIEW "Transactions Less Than 2" AS
SELECT "card_num", COUNT(amount) as "Total # of Charges under $2"
FROM "transaction"
WHERE amount < 2
GROUP BY card_num;


--Top 100 transactions between 7:00am and 9:00am
CREATE VIEW "Top 100 transactions" AS
SELECT * FROM "transaction"
WHERE EXTRACT(HOUR FROM date) = 07 OR EXTRACT(HOUR FROM date) = 08
ORDER BY amount DESC
limit 100;


--Top 5 merchant prone to being hacked using small transactions?
CREATE VIEW "Top 5 Merchants" AS
SELECT a.id_merchant, b.merchant_name, COUNT(a.id_merchant) as "Total Occurances by merchant"
FROM "transaction" as a
INNER JOIN merchant as b ON a.id_merchant = b.id_merchant
WHERE amount < 2
GROUP BY a.id_merchant, b.merchant_name
ORDER BY "Total Occurances by merchant" DESC
LIMIT 5;


-----Time only of cardholder 2 and cardholer 18 purchasess
SELECT a.date::TIME, a.amount, a.card_num, b.cardholder_id
FROM transaction as a
INNER JOIN credit_card as b 
	ON b.card_num = a.card_num
WHERE b.cardholder_id = 2 OR b.cardholder_id = 18


----Cardholder 25 purchases and merchant type
SELECT EXTRACT(MONTH FROM a.date) as "month", SUM(a.amount) as "Total purchases", d.category_name
FROM transaction as a
INNER JOIN credit_card as b 
	ON b.card_num = a.card_num
INNER JOIN merchant as c
	ON c.id_merchant = a.id_merchant
INNER JOIN merchant_cat as d
	ON d.id_merchant_category = c.id_merchant_category
WHERE b.cardholder_id = 25
GROUP BY category_name, EXTRACT(MONTH FROM a.date)
ORDER BY EXTRACT(MONTH FROM a.date), category_name;



