DROP TABLE IF EXISTS b2b_leads;

CREATE TABLE b2b_leads (
    lead_id SERIAL PRIMARY KEY,
    decision_maker_name TEXT,
    first_name TEXT,
    last_name TEXT,
    decision_maker_title TEXT,
    seniority_level TEXT,
    company_domain TEXT,
    industry TEXT,
    industry_sector TEXT,
    country TEXT,
    email_address TEXT,
    lead_priority_tier TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COPY b2b_leads(
    decision_maker_name,
    first_name,
    last_name,
    decision_maker_title,
    seniority_level,
    company_domain,
    industry,
    industry_sector,
    country,
    email_address,
    lead_priority_tier
)
FROM 'D:\Data Analytics\Project\b2b-lead-intelligence-firmographic-analysis\cleaned_data.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
SELECT * FROM b2b_leads;

SELECT COUNT(*) FROM b2b_leads;
