# CHW Activity Project (dbt + Postgres)

## Architecture
<img width="1536" height="1024" alt="CHW activity data" src="https://github.com/user-attachments/assets/c88bd2ee-c170-46f1-8049-7684dac5a5b1" />

This project models Community Health Worker (CHW) activity data using **dbt** with a **Postgres warehouse**.  
Raw data flows into staging models, then into marts for analytics-ready outputs.

---

## Setup
```bash
git clone https://github.com/<your-username>/chw_activity_project.git
cd chw_activity_project
python3 -m venv venv && source venv/bin/activate
pip install dbt-postgres
```

Copy `.env.example` → `.env` and fill in your Postgres credentials.

---

## Usage
```bash
dbt debug   # test connection
dbt run     # execute models
dbt test    # run tests
dbt docs generate && dbt docs serve
```

---

## Screenshots & Results

### 1. Connection Test (`dbt debug`)
<img width="1920" height="1080" alt="Screenshot 2025-12-01 165852" src="https://github.com/user-attachments/assets/3a0aad70-4933-41a2-bafc-95d59c8d2e99" />  
*Successful connection to Postgres warehouse.*

---

### 2. Pipeline Run (`dbt run`)
<img width="1920" height="359" alt="dbt run" src="https://github.com/user-attachments/assets/a40abc59-d778-422e-a012-6efb355ee726" />  
*Models executed successfully.*

---

### 3. Data Quality Tests (`dbt test`)
<img width="1920" height="703" alt="dbt test" src="https://github.com/user-attachments/assets/ca4a6396-6797-4046-8708-88aa95c1708d" />  
*All tests passed.*

---

### 4. Documentation (`dbt docs`)
<img width="1920" height="662" alt="dbt docs" src="https://github.com/user-attachments/assets/dfa8b7d4-be42-4bbe-8987-84d6c5254740" />  
*Docs generated and served locally.*

---
### 5.DBT  UI
<img width="1920" height="1080" alt="Screenshot 2025-12-01 162556" src="https://github.com/user-attachments/assets/55b7aa67-8e3b-4c67-9c67-b0398bd47f94" />

### 6. Lineage Graph
<img width="1920" height="1080" alt="Lineage Graph" src="https://github.com/user-attachments/assets/50c5604c-2d74-4c26-8ec8-641a9cf581a2" />  
*Shows flow from raw staging → marts.*

---

### 7. Aggregated Monthly Rollup (`marts.chw_activity_monthly`)
<img width="1920" height="170" alt="Monthly Rollup" src="https://github.com/user-attachments/assets/e6267e9f-a089-4911-ac31-80e64a23c53b" />  
*Monthly activity counts per CHV.*

---

Built by **Maina Murage** 

















