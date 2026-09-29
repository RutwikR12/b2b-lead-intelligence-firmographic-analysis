USE b2b_lead_intelligence;

DROP VIEW IF EXISTS vw_prioritized_b2b_leads;

CREATE VIEW vw_prioritized_b2b_leads AS
SELECT 
    `Decision Maker Name` AS decision_maker_name,
    `First Name` AS first_name,
    `Last Name` AS last_name,
    `Decision Maker Title` AS decision_maker_title,
    `Seniority Level` AS seniority_level,
    `Company_Domain` AS company_domain,
    `Industry` AS industry,
    `Country` AS country,
    `Email Address` AS email_address,
    
    -- Categorize Priority Tiers cleanly based on Seniority
    CASE 
        WHEN `Seniority Level` = 'Executive / C-Suite' THEN 'Tier 1 - High Priority'
        WHEN `Seniority Level` = 'Director Level' THEN 'Tier 2 - Medium Priority'
        WHEN `Seniority Level` = 'Managerial' THEN 'Tier 3 - Low Priority'
        ELSE 'Tier 4 - Nurture'
    END AS lead_priority_tier
FROM `b2b_contacts`;

SELECT * FROM vw_prioritized_b2b_leads;