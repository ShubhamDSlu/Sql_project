create database if not exists capstone;
use capstone;
SELECT * FROM `WA_Fn-UseC_-Telco-Customer-Churn`;

SELECT customerID, Churn FROM `WA_Fn-UseC_-Telco-Customer-Churn`;

SELECT customerID, gender, Churn
FROM `WA_Fn-UseC_-Telco-Customer-Churn`
WHERE gender = 'Female' AND Churn = 'Yes';

SELECT customerID, gender, Churn
FROM `WA_Fn-UseC_-Telco-Customer-Churn`
WHERE gender = 'male' AND Churn = 'NO';

SELECT * FROM `WA_Fn-UseC_-Telco-Customer-Churn` LIMIT 10;

SELECT customerID, Churn FROM `WA_Fn-UseC_-Telco-Customer-Churn`;

SELECT COUNT(*) AS total_customers FROM `WA_Fn-UseC_-Telco-Customer-Churn`;

SELECT Churn, COUNT(*) AS total
FROM `WA_Fn-UseC_-Telco-Customer-Churn`
GROUP BY Churn;

SELECT Contract, AVG(MonthlyCharges) AS avg_monthly
FROM `WA_Fn-UseC_-Telco-Customer-Churn`
GROUP BY Contract;

SELECT customerID, MonthlyCharges
FROM `WA_Fn-UseC_-Telco-Customer-Churn`
ORDER BY MonthlyCharges DESC
LIMIT 10;

SELECT customerID, MonthlyCharges,
       RANK() OVER (ORDER BY MonthlyCharges DESC) AS rank_no
FROM `WA_Fn-UseC_-Telco-Customer-Churn`;

SELECT customerID, tenure,
       DENSE_RANK() OVER (ORDER BY tenure DESC) AS tenure_rank
FROM `WA_Fn-UseC_-Telco-Customer-Churn`;


SELECT customerID, gender, MonthlyCharges,
       AVG(MonthlyCharges) OVER (PARTITION BY gender) AS avg_by_gender
FROM `WA_Fn-UseC_-Telco-Customer-Churn`;

SELECT customerID, tenure, MonthlyCharges,
       SUM(MonthlyCharges) OVER (ORDER BY tenure) AS running_total
FROM `WA_Fn-UseC_-Telco-Customer-Churn`;

SELECT customerID, MonthlyCharges,
       ROUND(MonthlyCharges * 100.0 / SUM(MonthlyCharges) OVER (), 2) AS percentage_share
FROM `WA_Fn-UseC_-Telco-Customer-Churn`;

SELECT t.customerID, t.PaymentMethod, p.category, t.Churn
FROM `WA_Fn-UseC_-Telco-Customer-Churn` t
JOIN payment_lookup p
ON t.PaymentMethod = p.method;











