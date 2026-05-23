use project;
select * from project.online_shoppers;

-- 1. Which months generate the highest conversion rates?

SELECT Month,
       ROUND(AVG(Revenue) * 100, 2) AS Conversion_Rate
FROM project.online_shoppers
GROUP BY Month
ORDER BY Conversion_Rate DESC;

-- Insight:-
-- November and October recorded the highest conversion rates, showing strong seasonal purchase intent during festive or sale periods.
-- Recommendation:- 
-- Increase marketing campaigns and promotional offers during high-conversion months to maximize revenue.

-----------------------------------------------------------------------------------------------------------------------------------

-- 2. Which visitor type generates the highest page value?

SELECT VisitorType,
       ROUND(AVG(PageValues), 2) AS Avg_PageValue
FROM project.online_shoppers
GROUP BY VisitorType
ORDER BY Avg_PageValue DESC;

-- Insight:-
-- New Visitors generated higher PageValues compared to Returning Visitors, indicating stronger purchase value per session.
-- Recommendation:-
-- Focus on converting new visitors through personalized onboarding and targeted product recommendations.

-----------------------------------------------------------------------------------------------------------------------------------

-- 3. Which traffic sources have the highest conversion rates?

SELECT TrafficType,
       ROUND(AVG(Revenue) * 100, 2) AS Conversion_Rate
FROM project.online_shoppers
GROUP BY TrafficType
ORDER BY Conversion_Rate DESC;

-- Insight:-
-- Traffic Types 16, 7, and 8 generated the strongest conversion performance, while some traffic sources had almost no conversions.
-- Recommendation:-
-- Invest more in high-performing traffic channels and optimize or remove low-performing acquisition sources.

-----------------------------------------------------------------------------------------------------------------------------------

-- 4. Do users spending more time on product pages convert more?

SELECT Revenue,
       ROUND(AVG(ProductRelated_Duration), 2) AS Avg_Product_Duration
FROM project.online_shoppers
GROUP BY Revenue;

-- Insight:-
-- Users who converted spent significantly more time on product pages than non-converting users.
-- Recommendation:-
-- Improve product content, images, and recommendations to encourage deeper product exploration.
-----------------------------------------------------------------------------------------------------------------------------------

-- 5. How do bounce rates affect conversions?

SELECT Revenue,
       ROUND(AVG(BounceRates), 4) AS Avg_BounceRate
FROM project.online_shoppers
GROUP BY Revenue;

-- Insight:-
-- Converted users had much lower bounce rates, indicating better engagement and smoother user journeys.
-- Recommendation:-
-- Optimize landing pages and ad targeting to reduce bounce behavior.

-----------------------------------------------------------------------------------------------------------------------------------

-- 6. Which months show the highest product engagement?

SELECT Month,
       ROUND(AVG(ProductRelated_Duration), 2) AS Avg_Engagement
FROM project.online_shoppers
GROUP BY Month
ORDER BY Avg_Engagement DESC;

-- Insight:-
-- November showed the highest product engagement, followed by August and September.
-- Recommendation:-
-- Launch major product campaigns during high-engagement months to improve conversion opportunities.

-----------------------------------------------------------------------------------------------------------------------------------

-- 7. Are returning visitors more engaged than new visitors?
SELECT VisitorType,
       ROUND(AVG(ProductRelated), 2) AS Avg_Product_Pages
FROM project.online_shoppers
GROUP BY VisitorType;

-- Insight:-
-- Returning Visitors browsed significantly more product pages than New Visitors, reflecting higher engagement.
-- Recommendation:-
-- Use loyalty programs and remarketing campaigns to retain engaged returning customers.

-----------------------------------------------------------------------------------------------------------------------------------

-- 8. Which traffic sources generate high bounce rates?

SELECT TrafficType,
       ROUND(AVG(BounceRates), 4) AS Avg_BounceRate
FROM project.online_shoppers
GROUP BY TrafficType
ORDER BY Avg_BounceRate DESC;

-- Insight:-
-- Traffic Types 15, 17 and 13 had the highest bounce rates, indicating poor-quality traffic.
-- Recommendation:-
-- Review traffic acquisition strategies and improve landing page relevance for these traffic sources.

-----------------------------------------------------------------------------------------------------------------------------------

-- 9. How does page value relate to conversions?

SELECT Revenue,
       ROUND(AVG(PageValues), 2) AS Avg_PageValue
FROM project.online_shoppers
GROUP BY Revenue;

-- Insight:-
-- Converted users had dramatically higher PageValues, showing strong correlation between PageValue and purchase success.
-- Recommendation:-
-- Focus on optimizing high-value product pages and recommendation systems.

-----------------------------------------------------------------------------------------------------------------------------------

-- 10. Do weekend visitors convert better?

SELECT Weekend,
       ROUND(AVG(Revenue) * 100, 2) AS Conversion_Rate
FROM project.online_shoppers
GROUP BY Weekend;

-- Insight:-
-- Weekend visitors showed slightly higher conversion rates compared to weekday visitors.
-- Recommendation:-
-- Increase weekend promotions and targeted campaigns to capture higher purchase intent.

-----------------------------------------------------------------------------------------------------------------------------------

-- 11. Does SpecialDay influence purchases?

SELECT SpecialDay,
       ROUND(AVG(Revenue) * 100, 2) AS Conversion_Rate
FROM project.online_shoppers
GROUP BY SpecialDay
ORDER BY Conversion_Rate DESC;

-- Insight:-
-- Conversion rates were highest when SpecialDay was 0, suggesting regular shopping periods outperformed holiday proximity periods.
-- Recommendation:-
-- Do not rely only on holiday-based promotions; maintain strong year-round engagement strategies.

-----------------------------------------------------------------------------------------------------------------------------------

-- 12. Which browsers generate better conversions?

SELECT Browser,
       ROUND(AVG(Revenue) * 100, 2) AS Conversion_Rate
FROM project.online_shoppers
GROUP BY Browser
ORDER BY Conversion_Rate DESC;

-- Insight:-
-- Certain browser groups showed significantly higher conversion rates, while Browser 3 and 9 underperformed.
-- Recommendation:-
-- Optimize website compatibility and user experience for lower-performing browsers.

-----------------------------------------------------------------------------------------------------------------------------------

-- 13. Which regions contribute the highest revenue?

SELECT Region,
       ROUND(AVG(Revenue) * 100, 2) AS Conversion_Rate
FROM project.online_shoppers
GROUP BY Region
ORDER BY Conversion_Rate DESC;

-- Insight:-
-- Regions 9, 2, 1 and 5 showed the highest conversion rates, while Region 8 had the lowest.
-- Recommendation:-
-- Focus regional marketing efforts on high-performing regions while improving engagement in weaker markets.

-----------------------------------------------------------------------------------------------------------------------------------

-- 14. Do users with lower exit rates convert more?

SELECT Revenue,
       ROUND(AVG(ExitRates), 4) AS Avg_ExitRate
FROM project.online_shoppers
GROUP BY Revenue;

-- Insight:-
-- Converted users had much lower exit rates, indicating smoother navigation and better purchase flow.
-- Recommendation:-
-- Improve high-exit pages and simplify the customer journey to reduce abandonment.

-----------------------------------------------------------------------------------------------------------------------------------

-- 15. Which month-visitor type combination produces the highest conversions?

SELECT Month, VisitorType,
      COUNT(*)                                       AS Sessions,
      SUM(Revenue)                                    AS Conversions,
      ROUND(100.0 * SUM(Revenue) / COUNT(*), 2)       AS Conv_Rate_Pct
      FROM   project.online_shoppers
      GROUP  BY Month, VisitorType
      ORDER  BY Conv_Rate_Pct DESC
      LIMIT  10;

-- Insight:-
-- New Visitors in November showed the highest conversion rate, followed by New Visitors in August and May.
-- Recommendation:-
-- Target new visitors aggressively during peak months with personalized campaigns and seasonal offers.

-----------------------------------------------------------------------------------------------------------------------------------

-- 16. Which visitor type converts the best — New or Returning?

SELECT VisitorType,
       ROUND(AVG(Revenue) * 100,2) AS Conversion_Rate
FROM project.online_shoppers
GROUP BY VisitorType
ORDER BY Conversion_Rate DESC;

-- Insight:-
-- New Visitors had the highest conversion rate, outperforming Returning Visitors.
-- Recommendation:-
-- Improve first-time visitor experience and strengthen acquisition strategies to maximize new customer conversions.

-----------------------------------------------------------------------------------------------------------------------------------

-- 17  Do users who browse more pages convert better?

SELECT Revenue,
       ROUND(AVG(TotalPages),2) AS Avg_TotalPages
FROM project.online_shoppers
GROUP BY Revenue;

-- Insight:-
-- Users who converted visited significantly more pages on average compared to non-converting users, indicating stronger engagement and higher purchase intent.
-- Recommendation:-
-- Improve internal navigation, product recommendations, and related product sections to encourage deeper website exploration.

-----------------------------------------------------------------------------------------------------------------------------------

-- 18 Do longer sessions lead to higher purchase intent?

SELECT Revenue,
       ROUND(AVG(TotalDuration),2) AS Avg_TotalDuration
FROM project.online_shoppers
GROUP BY Revenue;

-- Insight:-
-- Converted users spent substantially more time on the website, showing that longer browsing sessions are strongly associated with purchase behavior.
-- Recommendation:-
-- Enhance user engagement through interactive content, personalized recommendations, and optimized product pages to increase session duration and conversions.

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------