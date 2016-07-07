LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/product_2014.txt' INTO TABLE `dim_product_2014` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/product_2015.txt' INTO TABLE `dim_product_2015` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/region.txt' INTO TABLE `dim_region` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/customer.txt' INTO TABLE `dim_customer` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/shop.txt' INTO TABLE `dim_shop` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/waiter.txt' INTO TABLE `dim_waiter` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/time_2014.txt' INTO TABLE `dim_time_2014` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/time_2015.txt' INTO TABLE `dim_time_2015` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/RFM.txt' INTO TABLE `fact_rfm` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/sanpshot_customer_sale.txt' INTO TABLE `sanpshot_customer_sale` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/bh/ShopSaleSnapshot_1.txt' INTO TABLE `snapshot_sale_shop_1` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C://Users/cristph/Desktop/trainingData.txt' INTO TABLE `trainingdata` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';



set @bh_dataformat = 'txt_variable';
