USE b2b_lead_intelligence;

-- 2. Drop the view if it already exists to avoid conflicts
DROP VIEW IF EXISTS vw_prioritized_b2b_leads;

-- 3. Create the analytical view with Seniority Tiers and Macro Industry Sectors
CREATE VIEW vw_prioritized_b2b_leads AS
SELECT 
    `Decision Maker Name` AS decision_maker_name,
    `First Name` AS first_name,
    `Last Name` AS last_name,
    `Decision Maker Title` AS decision_maker_title,
    `Seniority Level` AS seniority_level,
    `Company_Domain` AS company_domain,
    `Industry` AS industry,
    
    -- Macro Industry Sector Mapping for Dashboard Filtering & Grouping
    CASE 
        WHEN `Industry` REGEXP 'software|it |information technology|internet|web|computer|saas|data processing|hosting|cyber|telecom|hardware|semiconductor' THEN 'Technology & IT'
        WHEN `Industry` REGEXP 'financial|bank|investment|insurance|wealth|credit|mortgage|accounting|fintech|capital|fund|venture|asset' THEN 'Finance & Banking'
        WHEN `Industry` REGEXP 'health|medical|pharma|biotech|hospital|therapeutics|wellness|clinical|diagnostics|dental|biopharma|genetics' THEN 'Healthcare & Lifesciences'
        WHEN `Industry` REGEXP 'hospitality|hotel|restaurant|travel|tourism|food|beverage|leisure|entertainment|gaming|casino|sports|recreation|fitness|event' THEN 'Hospitality & Leisure'
        WHEN `Industry` REGEXP 'consult|legal|law|accounting|marketing|advertising|public relations|hr|human resources|staffing|management advice|professional services|design|architecture|photography|security|investigation|auditing' THEN 'Professional Services'
        WHEN `Industry` REGEXP 'manufactur|industrial|machinery|automotive|motor vehicle|chemical|metals|textile|construction|building|engineering|logistics|transport|shipping|maritime|aerospace|cargo|freight|warehousing|packaging|printing' THEN 'Manufacturing & Industrial'
        WHEN `Industry` REGEXP 'retail|consumer|goods|e-commerce|ecommerce|apparel|fashion|store|shopping|wholesale|distributor|products' THEN 'Retail & Consumer Goods'
        WHEN `Industry` REGEXP 'educat|school|university|college|training|research|think tank|academy|library' THEN 'Education & Research'
        WHEN `Industry` REGEXP 'energy|oil|gas|utilities|renewables|environment|solar|power|mining|agriculture|farming|forestry|water|waste|recycling' THEN 'Energy & Natural Resources'
        WHEN `Industry` REGEXP 'nonprofit|non-profit|ngo|government|public sector|civic|social|association|political|philanthropy' THEN 'Government & Non-Profit'
        ELSE 'Other / Miscellaneous'
    END AS industry_sector,
    
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

SELECT * FROM b2b_lead_intelligence.vw_prioritized_b2b_leads;