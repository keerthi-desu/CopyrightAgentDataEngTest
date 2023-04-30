-- Make transformations

-- Determining the accuracy of the total activities
SELECT COUNT(DAS.activity_id)
FROM deal_activities_sample AS DAS
WHERE DAS.activity_id IN (SELECT DAS.activity_id
                            FROM deal_activities_sample AS DAS
                            WHERE DAS.deleted IS FALSE
                            AND DAS.marked_as_done_ts IS NOT NULL);


-- Finding the average amount of updates made to each deal
SELECT AVG(number_of_deals)
FROM (  SELECT DUS.deal_id, COUNT(DUS.update_type) AS number_of_deals
        FROM deal_updates_sample AS DUS
        WHERE DUS.update_type = 'Value' OR DUS.update_type = 'stage_id' OR DUS.update_type = 'Status'
        GROUP BY DUS.deal_id)X;


-- Marking deals that have neither activities nor updates as inactive
SELECT DS.id
FROM deal_sample AS DS
WHERE DS.id NOT IN (SELECT DAS.deal_id
                    FROM deal_activities_sample AS DAS

                    UNION

                    SELECT DUS.deal_id
                    FROM deal_updates_sample AS DUS);


-- Finding the number of calls and emails made for deals that have been won
SELECT DAS.Type, COUNT(DAS.deal_id)
FROM deal_activities_sample AS DAS
WHERE DAS.deal_id IN (SELECT DS.id
                        FROM deal_sample AS DS
                        WHERE DS.Status = 'won')
    AND DAS.Type = 'email' OR DAS.Type = 'call'
GROUP BY DAS.type;


-- Deals which have either have no activities or activities done within the last two years
SELECT DISTINCT DAS.deal_id
FROM deal_activities_sample AS DAS
WHERE EXTRACT('year' FROM CURRENT_DATE)-EXTRACT('year' FROM DAS.marked_as_done_ts) < 2;




