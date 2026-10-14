# B2B Lead Intelligence & Firmographic Analysis

## 📊 Project Overview & Executive Summary
This project engineered an end-to-end data processing and analytics pipeline to optimize an international database of **763 corporate leads**. By standardizing, enriching, and segmenting data across a multi-tool lifecycle (**Python ➔ Postgres SQL ➔ Power BI**), I established a structured lead intelligence model to replace flat, unorganized telemetry.

Because the raw dataset lacked pre-defined buyer targeting constraints, I designed a strategic prioritization framework based on corporate seniority levels. The final metrics reveal that while **Australia holds the largest overall market volume with 327 accounts**, the **United States provides the deepest target footprint with 104 Tier-1 High-Priority enterprise decision-makers.**

---

## 🛠️ Data Pipeline & Architecture Workflow
The project architecture maps an active, non-destructive data engineering pipeline designed for clean schema isolation and business maintainability:

1. **Data Cleansing & Ingestion (Python):** Processed raw text fields via `Pandas` to remove leading/trailing whitespaces, correct string capitalization anomalies, eliminate duplicate records, and safely resolve missing values using descriptive markers.
2. **Feature Enrichment (Python):** Engineered programmatic keyword arrays to evaluate raw job titles, parse them into systematic seniority brackets, and dynamically extract corporate email domains.
3. **Database Layer (Postgres SQL):** Abstracted calculation rows into a performant relational database layer, utilizing a database view (`CREATE VIEW`) to isolate business logic and ensure the workflow remains flexible to changing sales rules.
4. **Data Visualization (Power BI):** Developed an executive dashboard visualizing macro market concentrations, job level distributions, and cross-market segment matrices.

---

## 📁 Dataset & Firmographic Architecture
The analytics framework leverages explicit corporate fields to capture organizational profiles:
* **Core Contact Telemetry:** Decision Maker Name, First/Last Name Splits, Corporate E-mail Address, and Authenticated Web Domain.
* **Firmographic Categories:** Market Country, Professional Industry Segment, and Standardized Job Level Hierarchy.
* **Strategic Prioritization Tiers:**
  * **Tier 1 - High Priority (Executive / C-Suite):** Target accounts holding ultimate budgeting ownership and contract signature authority.
  * **Tier 2 - Medium Priority (Director Level):** Departmental budget managers and solution architecture evaluators.
  * **Tier 3 - Low Priority (Managerial):** Operational teams capable of user-level pilots requiring internal upward escalation.
  * **Tier 4 - Nurture (Individual Contributor / Other):** Automated low-overhead marketing communication segments.

---

## 📈 Key Market Insights
*The active Power BI dashboard maps clear business opportunities within the processed pipeline:*

* **Premium Executive Footprint:** The **United States holds a dominant 58.4% of the entire database's executive footprint** (104 out of 178 total Tier-1 C-Suite leads), making it the single deepest market for enterprise contracts.
* **Target Value Concentration Density:** **Canada** presents the highest relative conversion density, yielding **17 Executive/C-Suite contacts out of 36 regional profiles (47.22%)**, closely followed by the **United Kingdom at 37.14%** and the **United States at 32.81%**.
* **Regional Volume Dominance:** **Australia** represents your largest raw pipeline footprint with **327 accounts**, but it is heavily weighted toward lower-tier execution lines (**163 Individual Contributors**). 
* **Pipeline Structural Friction:** Across the overall database view, **Managerial (328)** and **Individual Contributors (243)** represent the dominant platform footprint, outnumbering direct **Executive/C-Suite decision-makers (178)**.

---

## 📊 Dashboard View
Below is the visual analytical model engineered to communicate core pipeline distributions to business stakeholders:

![B2B Lead Intelligence Dashboard](Lead Intelligence Dashboard Image.jpeg)

---

## 🚀 Strategic Sales Operations Recommendations

1. **Focus on the US for Big Enterprise Deals:** 
   * **Action:** Put your best sales efforts into the **United States**. 
   * **Reason:** The US holds **over half (58.4%) of your top-level C-Suite leaders** (104 out of 178), making it your best market for high-value sales.

2. **Quick Wins in Canada and the UK:**
   * **Action:** Reach out directly to leads in **Canada** and the **United Kingdom** right away.
   * **Reason:** Canada has the highest percentage of decision-makers (**47.22%**), followed closely by the UK (**37.14%**), meaning you will run into much less resistance closing deals there.

3. **Automate Your Approach for Australia:**
   * **Action:** Use automated email campaigns or digital marketing for **Australia** instead of spending hours on manual calls.
   * **Reason:** Even though Australia has the highest number of total leads (327), most of them are lower-tier staff (163 individual contributors) rather than final decision-makers.

4. **Target Healthcare and Manufacturing Sectors:**
   * **Action:** Tailor your sales pitches toward the **Healthcare** and **Manufacturing** industries.
   * **Reason:** Outside of miscellaneous categories, these two sectors hold the largest number of high-priority decision-makers ready for direct outreach.

