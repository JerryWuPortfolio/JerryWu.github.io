--Q4.1
SELECT COUNT(DISTINCT v.Name)
FROM Purchasing.Vendor v
WHERE v.CreditRating > 2

--Q4.2
SELECT v.Name, v.PreferredVendorStatus 
FROM Purchasing.Vendor v JOIN Purchasing.vVendorWithAddresses vvwa ON v.BusinessEntityID = vvwa.BusinessEntityID 
WHERE vvwa.StateProvinceName = 'Washington'

--Q4.3
SELECT COUNT(DISTINCT poh.PurchaseOrderID) AS Order2012, SUM(pod.ReceivedQty) AS TotalQty
FROM Purchasing.PurchaseOrderHeader poh JOIN Purchasing.PurchaseOrderDetail pod
ON poh.PurchaseOrderID = pod.PurchaseOrderID 
JOIN Purchasing.ShipMethod sm ON poh.ShipMethodID = sm.ShipMethodID 
WHERE poh.OrderDate LIKE '%2012%' AND (sm.Name LIKE '%Truck%' OR sm.Name LIKE '%Cargo Ship%')

--Q4.4
SELECT vvwa.Name AS VendorName, vvwa.StateProvinceName AS State, pv.LastReceiptCost AS Cost
FROM Purchasing.ProductVendor pv JOIN Purchasing.vVendorWithAddresses vvwa
ON pv.BusinessEntityID = vvwa.BusinessEntityID
ORDER BY pv.StandardPrice, pv.AverageLeadTime DESC

--Q4.5
SELECT vvwa.Name AS VendorName, DATEPART(YEAR, poh.OrderDate) AS Year, 
DATEPART(QUARTER, poh.OrderDate) AS QuarterSales, SUM(pod.OrderQty) AS TotalQuantity, SUM(pod.LineTotal) AS TotalSales
FROM Purchasing.Vendor v JOIN Purchasing.vVendorWithAddresses vvwa
ON v.BusinessEntityID = vvwa.BusinessEntityID
JOIN Purchasing.PurchaseOrderHeader poh 
ON v.BusinessEntityID = poh.VendorID 
JOIN Purchasing.PurchaseOrderDetail pod 
ON poh.PurchaseOrderID = pod.PurchaseOrderID 
WHERE vvwa.StateProvinceName = 'Washington'
GROUP BY vvwa.Name, DATEPART(YEAR, poh.OrderDate), DATEPART(QUARTER, poh.OrderDate)
ORDER BY DATEPART(YEAR, poh.OrderDate), DATEPART(QUARTER, poh.OrderDate)

--Q4.6
SELECT DISTINCT TOP 2 vvwc.Name, pod.OrderQty
FROM Purchasing.PurchaseOrderDetail pod JOIN Purchasing.PurchaseOrderHeader poh
ON pod.PurchaseOrderID = poh.PurchaseOrderID 
JOIN Purchasing.vVendorWithContacts vvwc 
ON poh.VendorID = vvwc.BusinessEntityID
ORDER BY pod.OrderQty DESC

--Q4.7
SELECT sm.name AS VendorName, COUNT(poh.ShipMethodID) AS ShippingAmount, AVG(pv.AverageLeadTime) AS LeadTime
FROM Purchasing.ShipMethod sm JOIN Purchasing.PurchaseOrderHeader poh
ON sm.ShipMethodID = poh.ShipMethodID
JOIN Purchasing.ProductVendor pv 
ON poh.VendorID = pv.BusinessEntityID 
GROUP BY sm.Name 
ORDER BY COUNT(poh.ShipMethodID) DESC

--Q4.8
SELECT TOP 1 sm.name AS VendorName, COUNT(poh.ShipMethodID) AS ShippingAmount, AVG(pv.AverageLeadTime) AS LeadTime
FROM Purchasing.ShipMethod sm JOIN Purchasing.PurchaseOrderHeader poh
ON sm.ShipMethodID = poh.ShipMethodID
JOIN Purchasing.ProductVendor pv 
ON poh.VendorID = pv.BusinessEntityID 
GROUP BY sm.Name 
ORDER BY COUNT(poh.ShipMethodID) DESC


--Q4.9
SELECT pv.BusinessEntityID AS VendorID, COUNT(pv.BusinessEntityID) AS NumberOfCustomers, 
AVG(pv.AverageLeadTime) AS AverageLeadTime, AVG(pv.StandardPrice) AS AveragePrice
FROM Purchasing.ProductVendor pv
GROUP BY pv.BusinessEntityID
ORDER BY COUNT(pv.BusinessEntityID) DESC

--Q4.10
SELECT TOP 1 pv.BusinessEntityID AS VendorID, COUNT(pv.BusinessEntityID) AS NumberOfCustomers, 
AVG(pv.AverageLeadTime) AS AverageLeadTime, AVG(pv.StandardPrice) AS AveragePrice
FROM Purchasing.ProductVendor pv
GROUP BY pv.BusinessEntityID
ORDER BY COUNT(pv.BusinessEntityID) DESC




