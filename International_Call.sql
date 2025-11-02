WITH calls AS (
    SELECT 
        pc.caller_id,
        pc.receiver_id,
        caller_info.country_id  AS caller_country,
        receiver_info.country_id AS receiver_country
    FROM phone_calls pc
    LEFT JOIN phone_info caller_info
        ON pc.caller_id = caller_info.caller_id
    LEFT JOIN phone_info receiver_info
        ON pc.receiver_id = receiver_info.caller_id
)
SELECT 
    ROUND(
        (SUM(CASE WHEN caller_country <> receiver_country THEN 1 ELSE 0 END)::numeric * 100.0)
        / COUNT(*),
        1
    ) AS international_calls_pct
FROM calls;
