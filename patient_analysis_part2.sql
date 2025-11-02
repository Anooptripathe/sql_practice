Select 
  Round(
  (Sum(case when call_category ILIKE 'n/a' or call_category is NULL then 1 else 0 end)::numeric * 100.0)
  /count(*),
  1)
as uncategorised_call_pct
from callers;