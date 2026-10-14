DROP VIEW IF EXISTS vw_prioritized_b2b_leads;

CREATE VIEW vw_prioritized_b2b_leads AS
SELECT 
    "decision_maker_name",
    "first_name",
    "last_name",
    "decision_maker_title",
    "seniority_level",
    "company_domain",
    "industry",
    
    CASE 
        WHEN "industry" ~* 'software|it |information technology|internet|web|computer|saas|data processing|hosting|cyber|telecom|hardware|semiconductor' THEN 'Technology & IT'
        WHEN "industry" ~* 'financial|bank|investment|insurance|wealth|credit|mortgage|accounting|fintech|capital|fund|venture|asset' THEN 'Finance & Banking'
        WHEN "industry" ~* 'health|medical|pharma|biotech|hospital|therapeutics|wellness|clinical|diagnostics|dental|biopharma|genetics' THEN 'Healthcare & Lifesciences'
        WHEN "industry" ~* 'hospitality|hotel|restaurant|travel|tourism|food|beverage|leisure|entertainment|gaming|casino|sports|recreation|fitness|event' THEN 'Hospitality & Leisure'
        WHEN "industry" ~* 'consult|legal|law|accounting|marketing|advertising|public relations|hr|human resources|staffing|management advice|professional services|design|architecture|photography|security|investigation|auditing' THEN 'Professional Services'
        WHEN "industry" ~* 'manufactur|industrial|machinery|automotive|motor vehicle|chemical|metals|textile|construction|building|engineering|logistics|transport|shipping|maritime|aerospace|cargo|freight|warehousing|packaging|printing' THEN 'Manufacturing & Industrial'
        WHEN "industry" ~* 'retail|consumer|goods|e-commerce|ecommerce|apparel|fashion|store|shopping|wholesale|distributor|products' THEN 'Retail & Consumer Goods'
        WHEN "industry" ~* 'educat|school|university|college|training|research|think tank|academy|library' THEN 'Education & Research'
        WHEN "industry" ~* 'energy|oil|gas|utilities|renewables|environment|solar|power|mining|agriculture|farming|forestry|water|waste|recycling' THEN 'Energy & Natural Resources'
        WHEN "industry" ~* 'nonprofit|non-profit|ngo|government|public sector|civic|social|association|political|philanthropy' THEN 'Government & Non-Profit'
        ELSE 'Other / Miscellaneous'
    END AS industry_sector,
    
    "country",
    "email_address",
    
    CASE 
        WHEN "seniority_level" = 'Executive / C-Suite' THEN 'Tier 1 - High Priority'
        WHEN "seniority_level" = 'Director Level' THEN 'Tier 2 - Medium Priority'
        WHEN "seniority_level" = 'Managerial' THEN 'Tier 3 - Low Priority'
        ELSE 'Tier 4 - Nurture'
    END AS lead_priority_tier
FROM b2b_leads;

SELECT * FROM vw_prioritized_b2b_leads;