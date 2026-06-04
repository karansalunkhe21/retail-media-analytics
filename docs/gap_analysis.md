# Gap Analysis — Retail Media Analytics Dataset

## Dataset
- Source: Kaggle eCommerce Behavior Data (Multi-Category Store)
- File: 2019-Oct.csv (sample of 100,000 rows)
- Date Range: 2019-10-01 (first 4.5 hours)

## Summary
6 data gaps identified across 3 severity levels.

## Gaps Found

### 🔴 High Severity

**GAP-001: Missing Category Code**
- 32,587 rows (32%) have no category_code
- Impact: Any analysis by product category will be incomplete
- Recommendation: Engineering to investigate tracking implementation

**GAP-002: Duplicate Records**
- Multiple events recorded 2-4x for same user/product/timestamp
- Impact: Inflates all metrics including conversion rate and revenue
- Recommendation: Deduplication logic needed in data pipeline

**GAP-003: Zero Price Records**
- 119 rows have a price of $0.00
- Impact: Breaks revenue calculations and avg price metrics
- Recommendation: Filter out or investigate source of zero prices

### 🟡 Medium Severity

**GAP-004: Missing Brand**
- 14,391 rows (14%) have no brand value
- Impact: Brand performance reporting will be unreliable
- Recommendation: Enrich via product catalog join

**GAP-005: Cart Events Lower Than Purchases**
- 1,215 cart events vs 1,655 purchase events
- Impact: Conversion funnel analysis is unreliable
- Recommendation: Engineering to audit cart event tracking

**GAP-006: High Price Values**
- 5,158 rows (5%) have price above $1,000
- Impact: May skew average price and revenue metrics
- Recommendation: Validate against product catalog

## Next Steps
- Share findings with engineering team
- Add gaps to product backlog for prioritization
- Begin data modeling with clean, filtered dataset