CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
BEGIN TRY

SET @batch_start_time = GETDATE();
PRINT '*******************';
PRINT 'Loading Bronze Layer CRM';
PRINT '*******************';


PRINT 'Loading the crm_cust_info';
SET @start_time = GETDATE();

TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\umair\OneDrive\Desktop\warhouse\datasets\source_crm\cust_info.csv'
WITH(
    Firstrow = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


SET @start_time = GETDATE();
PRINT 'Loading the crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\umair\OneDrive\Desktop\warhouse\datasets\source_crm\prd_info.csv'

WITH(
    Firstrow = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


 SET @start_time = GETDATE();
PRINT 'Loading the crm_sales_details';
TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\umair\OneDrive\Desktop\warhouse\datasets\source_crm\sales_details.csv'

WITH(
    Firstrow = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';




PRINT '==================';
PRINT 'Loading Bronze Layer ERP';
PRINT '==================';
SET @start_time = GETDATE();
PRINT 'Loading the erp_cust_az12';
TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\umair\OneDrive\Desktop\warhouse\datasets\source_erp\CUST_AZ12.csv'
WITH(

FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


SET @start_time = GETDATE();
PRINT 'Loading the erp_loc_a101';
TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\umair\OneDrive\Desktop\warhouse\datasets\source_erp\LOC_A101.csv'
WITH(

FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


SET @start_time = GETDATE();
PRINT 'Loading the erp_px_cat_g1v2';

TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\umair\OneDrive\Desktop\warhouse\datasets\source_erp\PX_CAT_G1V2.csv'
WITH(

FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';



END TRY
  BEGIN CATCH
  PRINT '======================';
  PRINT 'ERROR';
  PRINT '======================';
  END CATCH
END
