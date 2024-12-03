mkdir -p ~/.kaggle
aws s3 cp "s3://flipkart-ingestion-bucket/DataIngestion.sh" ~/.kaggle/
chmod 600 ~/.kaggle/kaggle.json
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip install boto3
pip install Kaggle
pip install csvkit
aws s3 cp "s3://flipkart-ingestion-bucket/download_data.py" .
chmod 777 download_data.py
python3 download_data.py
aws s3 cp product.csv "s3://ec2-datafrom-flipkart/folder_for_product_flipkart/"
csvstack sales_apr1.csv sales_apr2.csv sales_may1.csv sales_may2.csv sales_jun1.csv sales_jun2.csv sales_jul1.csv > fact_sales.csv
aws s3 cp fact_sales.csv "s3://ec2-datafrom-flipkart/folder_for_sales_flipkart/"
