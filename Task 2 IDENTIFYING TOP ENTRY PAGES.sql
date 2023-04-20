CREATE TEMPORARY TABLE  first_pv_per_session
SELECT website_session_id,
       min(website_pageview_id) AS first_pv
FROM website_pageviews
WHERE created_at<'2012-06-12'
GROUP BY 1 ;

SELECT website_pageviews.pageview_url AS landing_page_url,
       count(distinct first_pv_per_session.website_session_id) AS sessions_hitting_page
FROM first_pv_per_session
LEFT JOIN website_pageviews
ON first_pv_per_session.first_pv=website_pageviews.website_pageview_id
GROUP BY 1;
