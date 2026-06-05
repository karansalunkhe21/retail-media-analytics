# Data Dictionary — Retail Media Analytics

## Dataset Overview
- Source: Kaggle eCommerce Behavior Data
- Period: October 2019 (sample of 100,000 rows)
- Cleaned Row Count: 99,864

---

## Metrics

### Conversion Rate
- **Definition:** Percentage of users who viewed a product and 
  then purchased it
- **Formula:** (Unique Purchasers / Unique Viewers) x 100
- **Owner:** Analytics Team
- **Refresh:** Daily

### Average Order Value (AOV)
- **Definition:** Average amount spent per purchase event
- **Formula:** Total Revenue / Total Purchases
- **Owner:** Revenue Team
- **Refresh:** Daily

### Total Revenue
- **Definition:** Sum of all purchase event prices
- **Formula:** SUM(price) WHERE event_type = 'purchase'
- **Owner:** Finance Team
- **Refresh:** Daily

### Funnel Drop-off Rate
- **Definition:** Percentage of users lost between each funnel stage
- **Formula:** (Stage A Users - Stage B Users) / Stage A Users x 100
- **Owner:** Product Team
- **Refresh:** Weekly

---

## Dimensions

### event_type
- **Values:** view, cart, purchase
- **Description:** Action taken by the user on the platform

### category_code
- **Format:** parent.child (e.g. electronics.smartphone)
- **Null Rate:** 32% — see GAP-001
- **Description:** Product category hierarchy

### brand
- **Null Rate:** 14% — see GAP-004
- **Description:** Product brand name

### user_session
- **Description:** Unique identifier for a single browsing session
- **Note:** One user can have multiple sessions