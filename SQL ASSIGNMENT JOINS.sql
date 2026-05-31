-- Databricks notebook source
--Part A - INNER JOINS
--Q1 Show every user who has a subscription. Match users to subscriptions.
SELECT 
     A.user_id,
     A.user_name,
     B.subscription_id,
     B.start_date
FROM workspace.default.users AS A
INNER JOIN workspace.default.subscriptions AS B
ON A.user_id = B.user_id;

--Q2 Show every subscription with its matching plan name and monthly price.
SELECT 
     A.subscription_id,
     A.user_id,
     B.plan_name,
     B.monthly_price
FROM workspace.default.subscriptions AS A
INNER JOIN workspace.default.plans AS B
ON A.plan_id = B.plan_id;

--Q3 Show every viewing session that has a matching show. Include the show title and 
--genre.
SELECT
     session_id,
     user_id,
     show_title,
     genre,
     watch_minutes
FROM workspace.default.viewing_sessions AS A
INNER JOIN workspace.default.shows AS B
ON A.show_id = B.show_id;

--Q4 Show every viewing session with the user who watched it. Only show sessions with a 
--matching user.
SELECT
     user_name,
     country,
     session_id,
     show_id,
     watch_minutes
FROM workspace.default.users AS A
INNER JOIN workspace.default.viewing_sessions AS B
ON A.user_id = B.user_id;

--Q5 Show users along with their subscriptions, the plan name, and the price. 
--Use only users who have both a subscription and a valid plan.
SELECT
     user_name,
     country,
     plan_name,
     monthly_price,
     start_date
FROM workspace.default.users AS A
INNER JOIN workspace.default.subscriptions AS B
ON A.user_id = B.user_id
INNER JOIN workspace.default.plans AS C
ON B.plan_id = C.plan_id;
 
--Part B LEFT JOIN
--Q6 Show every user and any subscriptions they have. Users without subscriptions must still 
--appear
SELECT
     A.user_id,
     A.user_name,
     B.subscription_id,
     B.start_date
FROM workspace.default.users AS A
LEFT JOIN workspace.default.subscriptions AS B
ON A.user_id = B.user_id;

--Q7 Show every plan and the subscriptions on it. Plans with no subscribers must still 
--appear
SELECT 
     A.plan_id,
     A.plan_name,
     B.subscription_id,
     B.user_id
FROM workspace.default.plans AS A
LEFT JOIN workspace.default.subscriptions AS B
ON A.plan_id = B.plan_id; 

--Q8 Show every show and any viewing sessions on it. Shows that were never watched must 
--still appear.
SELECT
     A.show_id,
     A.show_title,
     B.session_id,
     B.watch_minutes
FROM workspace.default.shows AS A
INNER JOIN workspace.default.viewing_sessions AS B
ON A.show_id = B.show_id;

--Q9 Show every viewing session and the user who watched it. Sessions referencing users 
--that do not exist must still appear (with NULL user details).
SELECT
     A.session_id,
     A.show_id,
     A.watch_minutes,
     B.user_id,
     B.user_name
FROM workspace.default.viewing_sessions AS A
INNER JOIN workspace.default.users AS B
ON A.user_id = B.user_id;

--Q10 Show every user, the plan they are on (if any), and the monthly price. Users without a 
--subscription must still appear.
SELECT
     A.user_name,
     A.country,
     C.plan_name,
     C.monthly_price
FROM workspace.default.users AS A
LEFT JOIN workspace.default.subscriptions AS B
ON A.user_id = B.user_id
LEFT JOIN workspace.default.plans AS C
ON B.plan_id = C.plan_id;

--PART C FULL OUTER JOIN
--Q11 Show every user and every subscription, including users without subscriptions AND 
--subscriptions referencing users that do not exist.
SELECT
     A.user_id,
     A.user_name,
     B.subscription_id,
     B.start_date
FROM workspace.default.users AS A
FULL OUTER JOIN workspace.default.subscriptions AS B
ON A.user_id = B.user_id;

--Q12 Show every plan and every subscription, including plans without subscribers AND any
--subscription referencing a plan that does not exist.
SELECT
     A.plan_id,
     A.plan_name,
     B.subscription_id,
     B.user_id
FROM workspace.default.plans AS A
FULL OUTER JOIN workspace.default.subscriptions AS B
ON A.plan_id = B.plan_id;

--Q13 Show every show and every viewing session, including shows that were never watched 
--AND sessions referencing shows that do not exist.
SELECT 
     A.show_id, 
     A.show_title,
     B.session_id, 
     B.watch_minutes
FROM workspace.default.shows AS A
FULL OUTER JOIN workspace.default.viewing_sessions AS B
ON A.show_id = B.show_id;

--Q14 Show every user and every viewing session, including users with no sessions AND 
--sessions referencing users who do not exist.
SELECT 
     A.user_id, 
     A.user_name, 
     B.session_id, 
     B.watch_minutes
FROM workspace.default.users AS A 
FULL OUTER JOIN workspace.default.viewing_sessions  AS B
ON A.user_id = B.user_id;

--Q15 Show every user, every subscription, and every plan in one query — using FULL OUTER 
--JOIN throughout. This is the hardest question — get all gaps visible at once.
SELECT 
      A.user_id, 
      A.user_name,  
      B.subscription_id, 
      C.plan_id, 
      C.plan_name
FROM workspace.default.users AS A 
FULL OUTER  JOIN workspace.default.subscriptions AS B
ON A.user_id = B.user_id
FULL OUTER JOIN workspace.default.plans AS C
ON B.plan_id = C.plan_id;



