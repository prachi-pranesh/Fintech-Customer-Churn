# Fintech Customer Churn & Retention Intelligence

## Predictive Risk Segmentation & Retention Strategy

An end-to-end fintech customer churn analytics project combining **SQL, Python, Machine Learning, and Power BI** to identify churn drivers, predict customer churn risk, segment high-risk customers, and translate analytical findings into actionable retention strategies.

---

## 📌 Project Overview

Customer retention is critical for financial services companies because acquiring a new customer can be significantly more expensive than retaining an existing one.

This project analyzes customer-level banking data to answer four key questions:

1. **Who is most likely to churn?**
2. **What customer characteristics are associated with churn?**
3. **Can machine learning identify customers at high risk of churn?**
4. **How can the business prioritize retention interventions?**

The analysis combines exploratory SQL analysis with predictive machine learning and an interactive Power BI dashboard.

> **Dataset note:** This project uses a publicly available bank customer churn dataset.
---

# 🎯 Business Objectives

The project aims to:

- Understand the overall customer churn rate
- Identify major churn drivers
- Analyze churn across customer segments
- Build a predictive churn model
- Create customer-level churn probabilities
- Segment customers into Low, Medium, and High risk
- Identify priority retention segments
- Recommend targeted retention strategies
- Build a management-ready dashboard for decision-making

---

# 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| **MySQL** | Data storage, cleaning and business analysis |
| **Python** | Exploratory Data Analysis and machine learning |
| **Pandas / NumPy** | Data manipulation |
| **Scikit-learn** | Machine learning |
| **Matplotlib / Seaborn** | Data visualization |
| **Power BI** | Interactive dashboard and segmentation |
| **PowerPoint** | Executive business presentation |

---

# 📊 Dataset

The dataset contains **10,000 customer records** and includes information such as:

- Credit Score
- Geography
- Gender
- Age
- Tenure
- Account Balance
- Number of Products
- Credit Card Ownership
- Active Membership Status
- Estimated Salary
- Customer Churn (`Exited`)

### Target Variable

`Exited`

- `0` → Customer stayed
- `1` → Customer churned

---

# 🔍 SQL Analysis

The dataset was loaded into MySQL and analyzed using SQL to identify major churn patterns.

## Overall Churn

| Metric | Result |
|---|---:|
| Total Customers | 10,000 |
| Stayed | 7,963 |
| Churned | 2,037 |
| Overall Churn Rate | **20.37%** |

---

## 🌍 Churn by Geography

| Geography | Churn Rate |
|---|---:|
| Germany | **32.44%** |
| Spain | 16.67% |
| France | 16.15% |

Germany showed substantially higher churn than France and Spain.

---

## 🧑‍💼 Churn by Activity

| Customer Status | Churn Rate |
|---|---:|
| Inactive | **26.85%** |
| Active | 14.27% |

Inactive customers showed a significantly higher churn rate.

---

## 📦 Churn by Number of Products

| Products | Churn Rate |
|---|---:|
| 1 | **27.71%** |
| 2 | 7.58% |
| 3 | 82.71%* |
| 4 | 100%* |

\*The 3- and 4-product groups contain relatively few customers, so these rates should not be interpreted as reliable population-level patterns.

The analysis therefore focuses primarily on the 1- and 2-product segments.

---

## 👤 Churn by Age

| Age Group | Churn Rate |
|---|---:|
| Under 30 | 7.56% |
| 30–39 | 10.88% |
| 40–49 | 30.79% |
| 50–59 | **56.04%** |
| 60+ | 27.95% |

Age emerged as one of the strongest churn differentiators.

---

# 🧩 Key Churn Drivers

The SQL analysis identified several important patterns:

### 1. Age

Customers aged **50–59** had a churn rate of **56.04%**, substantially above the overall 20.37%.

### 2. Geography

Germany had a churn rate of **32.44%**, almost twice the churn rate observed in France and Spain.

### 3. Customer Activity

Inactive customers churned at **26.85%**, compared with 14.27% for active customers.

### 4. Product Relationship

Customers with one product had a churn rate of **27.71%**, compared with 7.58% for customers with two products.

---

# 🤖 Machine Learning

Two classification models were developed:

1. Logistic Regression
2. Random Forest

The dataset was split into:

- **80% Training**
- **20% Testing**

Stratified sampling was used to preserve the churn/non-churn distribution.

---

# 📈 Model Performance

## Logistic Regression

| Metric | Result |
|---|---:|
| Accuracy | 80.8% |
| Churn Precision | 59% |
| Churn Recall | 18.7% |
| Churn F1 | 28% |
| ROC-AUC | 0.775 |

---

## Random Forest

| Metric | Result |
|---|---:|
| Accuracy | **86.0%** |
| Churn Precision | **79%** |
| Churn Recall | **44%** |
| Churn F1 | **57%** |
| ROC-AUC | **0.855** |

Random Forest provided substantially stronger predictive performance, particularly for identifying customers who churned.

---

# 🎚️ Churn Probability Threshold

Instead of using the default 50% probability threshold, multiple thresholds were evaluated.

| Threshold | Precision | Recall | F1 |
|---:|---:|---:|---:|
| 20% | 47% | 78% | 0.59 |
| 25% | 52% | 71% | 0.60 |
| **30%** | **60%** | **65%** | **0.63** |
| 35% | 64% | 58% | 0.61 |
| 40% | 70% | 54% | 0.61 |
| 50% | 78% | 45% | 0.57 |

A **30% probability threshold** was selected because it provided the strongest F1 score while materially improving recall.

On the held-out test set:

- **443 / 2,000 customers** were flagged
- **22.15%** of the test population was flagged for potential retention intervention

---

# 🚦 Customer Risk Segmentation

Customers were segmented based on predicted churn probability.

| Risk Level | Definition |
|---|---|
| 🟢 Low | ≤ 30% |
| 🟡 Medium | >30% and ≤60% |
| 🔴 High | >60% |

### Test Set Risk Distribution

| Risk Level | Customers | Observed Churn Rate |
|---|---:|---:|
| Low | 1,560 | 9.1% |
| Medium | 274 | 45.3% |
| High | 166 | **84.9%** |

The high-risk group demonstrated a substantially higher observed churn rate than the overall customer population.

---

# 🎯 Priority Customer Segment

A particularly important segment identified through the analysis was:

**Germany + Age ≥40 + 1 Product + Inactive**

Across the full dataset, this segment contained:

- **373 customers**
- **271 churned customers**
- **72.65% churn rate**

This segment represents a strong candidate for targeted retention initiatives because multiple risk signals overlap.

---

# 🌲 Model Feature Importance

Random Forest feature importance identified the following leading predictive variables:

| Feature | Importance |
|---|---:|
| Age | 0.252 |
| Balance | 0.142 |
| Estimated Salary | 0.138 |
| Credit Score | 0.134 |
| Number of Products | 0.131 |
| Tenure | 0.080 |
| Active Member | 0.036 |
| Germany | 0.033 |

> Feature importance indicates predictive contribution within the model; it does **not** establish causality.

---

# 📊 Power BI Dashboard

The Power BI dashboard was designed as a management-oriented churn intelligence tool.

## Dashboard Pages

### 1. Executive Overview

Provides a high-level view of:

- Total customers
- Churned customers
- Overall churn rate
- High-risk customers
- Predicted churners
- High-risk churn rate
- Churn by geography
- Churn by age
- Churn by product count
- Churn by activity

### 2. Customer Risk & Retention

Focuses on:

- Risk distribution
- Churn rate by risk level
- Customer-level churn probability
- Probability distribution
- High-risk customer identification
- Retention target pool

### 3. Strategic Segmentation

Provides dynamic analysis across:

- Geography
- Age
- Number of products
- Activity status

A Power BI **Field Parameter** allows the user to dynamically change the segmentation dimension.

### 4. Retention Strategy

Translates analytical findings into potential retention actions and customer prioritization.

---

# 💡 Retention Strategy

The analysis suggests a differentiated retention approach.

## 🔴 High Risk

Customers with high predicted churn probability.

Potential actions:

- Proactive relationship-manager outreach
- Personalized retention offers
- Product bundling recommendations
- Service/experience reviews
- Priority customer support

## 🟡 Medium Risk

Customers showing multiple warning signals.

Potential actions:

- Engagement campaigns
- Product education
- Personalized recommendations
- Usage-based communication

## 🟢 Low Risk

Customers with relatively low predicted churn probability.

Potential actions:

- Maintain engagement
- Cross-sell relevant products
- Loyalty and relationship-building initiatives

---

# 📏 Retention Measurement Framework

Future retention initiatives should be evaluated using measurable KPIs such as:

### Primary KPI

**Churn Rate**

### Secondary KPIs

- Retention rate
- Reactivation rate
- Product adoption
- Customer engagement
- Offer acceptance
- Customer lifetime value
- Cost per retained customer

A/B testing should be used to determine whether retention interventions actually reduce churn rather than assuming correlation implies impact.

---

# ⚠️ Limitations

This project has several limitations:

- The dataset is a public bank customer dataset rather than real fintech production data.
- The dataset represents a historical snapshot.
- No time-series customer behavior is available.
- No transaction-level behavioral data is available.
- No actual intervention outcomes are available.
- Model predictions should therefore be treated as decision-support signals rather than guaranteed churn outcomes.
- Small segments, particularly customers with 3–4 products, can produce unstable churn rates.
- Feature importance should not be interpreted as causal impact.
- Business ROI has not been claimed because no real intervention experiment was conducted.

---

# 🚀 Future Improvements

Potential next steps include:

- Hyperparameter tuning
- XGBoost / LightGBM comparison
- SHAP-based model explainability
- Customer Lifetime Value modeling
- Time-series churn prediction
- Transaction-level behavioral features
- Automated scoring pipelines
- Real-time churn monitoring
- A/B testing retention interventions
- Integration with CRM systems
- Automated retention alerts

