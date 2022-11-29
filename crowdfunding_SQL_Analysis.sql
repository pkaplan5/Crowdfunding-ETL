-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cf_id, backers_count FROM campaign
WHERE outcome='live'
ORDER BY backers_count DESC
-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT first_name, last_name, email, (pledged-goal) as remaining 
FROM backers
INNER JOIN campaign ON backers.cf_id=campaign.cf_id
WHERE campaign.outcome='live'
ORDER BY remaining DESC

-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT first_name, last_name, email, (goal-pledged) AS "left of goal"
INTO email_backers_remaining_goal_amount
FROM backers
INNER JOIN campaign ON backers.cf_id=campaign.cf_id
WHERE campaign.outcome='live'
ORDER BY "left of goal" DESC



-- Check the table


