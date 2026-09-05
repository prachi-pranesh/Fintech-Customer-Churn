-- CREATE DATABASE fintech_churn;
-- USE fintech_churn;
-- CREATE TABLE churn_customers (
--     RowNumber INT,
--     CustomerId BIGINT,
--     Surname VARCHAR(100),
--     CreditScore INT,
--     Geography VARCHAR(50),
--     Gender VARCHAR(20),
--     Age INT,
--     Tenure INT,
--     Balance DECIMAL(15,2),
--     NumOfProducts INT,
--     HasCrCard INT,
--     IsActiveMember INT,
--     EstimatedSalary DECIMAL(15,2),
--     Exited INT
-- );	
-- USE fintech_churn;

-- SELECT COUNT(*) AS total_customers
-- FROM churn_customers;

-- SELECT *
-- FROM churn_customers;


USE fintech_churn;

SELECT *
FROM churn_customers;


SELECT COUNT(*) AS total_customers
FROM churn_customers;


SELECT
    Exited,
    COUNT(*) AS customers
FROM churn_customers
GROUP BY Exited;


SELECT
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers;


SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY Geography
ORDER BY churn_rate DESC;


SELECT
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY IsActiveMember
ORDER BY churn_rate DESC;


SELECT
    Geography,
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY Geography, IsActiveMember
ORDER BY Geography, churn_rate DESC;


SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


SELECT
    Geography,
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY Geography, NumOfProducts
ORDER BY Geography, NumOfProducts;



SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY age_group
ORDER BY churn_rate DESC;



SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY age_group, NumOfProducts
ORDER BY age_group, NumOfProducts;



SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
WHERE Age BETWEEN 50 AND 59
  AND NumOfProducts = 1
GROUP BY Geography
ORDER BY churn_rate DESC;



SELECT
    CASE
        WHEN CreditScore < 500 THEN 'Below 500'
        WHEN CreditScore BETWEEN 500 AND 599 THEN '500-599'
        WHEN CreditScore BETWEEN 600 AND 699 THEN '600-699'
        WHEN CreditScore BETWEEN 700 AND 799 THEN '700-799'
        ELSE '800+'
    END AS credit_score_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY credit_score_group
ORDER BY churn_rate DESC;



SELECT
    CASE
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance < 50000 THEN 'Below 50K'
        WHEN Balance BETWEEN 50000 AND 99999 THEN '50K-100K'
        WHEN Balance BETWEEN 100000 AND 149999 THEN '100K-150K'
        ELSE '150K+'
    END AS balance_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY balance_group
ORDER BY churn_rate DESC;


SELECT
    Tenure,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY Tenure
ORDER BY Tenure;


SELECT
    HasCrCard,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
GROUP BY HasCrCard;

SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
WHERE Geography = 'Germany'
  AND NumOfProducts = 1
  AND IsActiveMember = 0;
  
  
  SELECT
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
WHERE Geography = 'Germany'
  AND Age BETWEEN 50 AND 59
  AND NumOfProducts = 1
GROUP BY IsActiveMember
ORDER BY churn_rate DESC;


SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_customers
WHERE Geography = 'Germany'
  AND Age >= 40
  AND NumOfProducts = 1
  AND IsActiveMember = 0;
  
  SELECT
    CustomerId,
    Geography,
    Age,
    NumOfProducts,
    IsActiveMember,
    Balance,
    Exited,

    (
        CASE WHEN Geography = 'Germany' THEN 2 ELSE 0 END
        +
        CASE WHEN Age >= 40 THEN 2 ELSE 0 END
        +
        CASE WHEN NumOfProducts = 1 THEN 2 ELSE 0 END
        +
        CASE WHEN IsActiveMember = 0 THEN 2 ELSE 0 END
        +
        CASE WHEN Balance > 100000 THEN 1 ELSE 0 END
    ) AS risk_score

FROM churn_customers;


SELECT
    risk_score,
    CASE
        WHEN risk_score <= 2 THEN 'Low Risk'
        WHEN risk_score <= 5 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS risk_level,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM (
    SELECT
        CustomerId,
        Exited,
        (
            CASE WHEN Geography = 'Germany' THEN 2 ELSE 0 END
            +
            CASE WHEN Age >= 40 THEN 2 ELSE 0 END
            +
            CASE WHEN NumOfProducts = 1 THEN 2 ELSE 0 END
            +
            CASE WHEN IsActiveMember = 0 THEN 2 ELSE 0 END
            +
            CASE WHEN Balance > 100000 THEN 1 ELSE 0 END
        ) AS risk_score
    FROM churn_customers
) AS scored_customers
GROUP BY risk_score
ORDER BY risk_score;



SELECT
    risk_level,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        100.0 * SUM(Exited) / COUNT(*),
        2
    ) AS churn_rate
FROM (
    SELECT
        Exited,
        CASE
            WHEN (
                CASE WHEN Geography = 'Germany' THEN 2 ELSE 0 END
                +
                CASE WHEN Age >= 40 THEN 2 ELSE 0 END
                +
                CASE WHEN NumOfProducts = 1 THEN 2 ELSE 0 END
                +
                CASE WHEN IsActiveMember = 0 THEN 2 ELSE 0 END
                +
                CASE WHEN Balance > 100000 THEN 1 ELSE 0 END
            ) <= 2 THEN 'Low Risk'

            WHEN (
                CASE WHEN Geography = 'Germany' THEN 2 ELSE 0 END
                +
                CASE WHEN Age >= 40 THEN 2 ELSE 0 END
                +
                CASE WHEN NumOfProducts = 1 THEN 2 ELSE 0 END
                +
                CASE WHEN IsActiveMember = 0 THEN 2 ELSE 0 END
                +
                CASE WHEN Balance > 100000 THEN 1 ELSE 0 END
            ) <= 5 THEN 'Medium Risk'

            ELSE 'High Risk'
        END AS risk_level
    FROM churn_customers
) AS risk_data
GROUP BY risk_level
ORDER BY
    CASE risk_level
        WHEN 'Low Risk' THEN 1
        WHEN 'Medium Risk' THEN 2
        WHEN 'High Risk' THEN 3
    END;