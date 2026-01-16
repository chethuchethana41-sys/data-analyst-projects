use adventure;
##KPI Cards (Totals)
##Q1. Total Sales
SELECT SUM(SalesAmount) AS TotalSales
FROM sales;

###Q2. Total Profit###
SELECT SUM(SalesAmount - TotalProductCost) AS TotalProfit
FROM sales;


###Q3. Total Orders###
SELECT COUNT(OrderQuantity) AS TotalOrders
FROM sales;


###Q4. Total Production Cost###
SELECT SUM(TotalProductCost) AS TotalProductionCost
FROM sales;


###Time-Series Analysis (Year / Quarter / Month / Day)###
#####Q6. Year-wise Sales#####
SELECT d.CalendarYear, SUM(s.SalesAmount) AS YearlySales
FROM sales s
JOIN dimdate d ON s.OrderDateKey = d.DateKey
GROUP BY d.CalendarYear
ORDER BY d.CalendarYear;

###Q7. Month-wise Sales###
SELECT d.EnglishMonthName, SUM(s.SalesAmount) AS MonthlySales
FROM sales s
JOIN dimdate d ON s.OrderDateKey = d.DateKey
GROUP BY d.EnglishMonthName, d.MonthNumberOfYear
ORDER BY d.MonthNumberOfYear;


###Q8. Quarter-wise Sales###
SELECT d.CalendarQuarter, SUM(s.SalesAmount) AS QuarterlySales
FROM sales s
JOIN dimdate d ON s.OrderDateKey = d.DateKey
GROUP BY d.CalendarQuarter
ORDER BY d.CalendarQuarter;

###Q9. Day-wise Sales for a Selected Month & Year###
SELECT d.DayNumberOfMonth, SUM(s.SalesAmount) AS DailySales
FROM sales s
JOIN dimdate d ON s.OrderDateKey = d.DateKey
WHERE d.CalendarYear = 2013 AND d.MonthNumberOfYear = 6
GROUP BY d.DayNumberOfMonth
ORDER BY d.DayNumberOfMonth;







