import pandas as pd

# Create the data for each branch
data_a = {
    "transaction_id": [1, 2, 3, 4, 5, 6],
    "branch": ["A", "A", "A", "A", "A", "A"],
    "date": ["2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", None, "2023-01-06"],
    "product_id": [101, 102, 103, 101, 104, 105],
    "quantity": [2, 1, 3, 2, 1, 2],
    "price": [50.0, 20.0, 15.0, 50.0, 30.0, 25.0],
    "customer_id": ["C001", "C002", "C003", "C004", "C005", None]
}

data_b = {
    "transaction_id": [7, 8, 9, 10, 11, 12],
    "branch": ["B", "B", "B", "B", "B", "B"],
    "date": ["2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05", "2023-01-06"],
    "product_id": [101, 106, 107, 108, 109, 107],
    "quantity": [1, 2, 3, 1, 2, 3],
    "price": [50.0, 40.0, 25.0, 30.0, 35.0, 25.0],
    "customer_id": ["C006", "C007", "C008", "C009", "C010", "C011"]
}

data_c = {
    "transaction_id": [13, 14, 14, 15, 16, 17],
    "branch": ["C", "C", "C", "C", "C", "C"],
    "date": ["2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05", "2023-01-06"],
    "product_id": [110, 111, 112, 113, 114, 115],
    "quantity": [1, 2, 1, 2, 3, 2],
    "price": [60.0, 20.0, 70.0, 50.0, 30.0, 80.0],
    "customer_id": ["C012", "C013", "C014", "C015", "C016", "C017"]
}

# Create DataFrames for each branch
branch_a = pd.DataFrame(data_a)
branch_b = pd.DataFrame(data_b)
branch_c = pd.DataFrame(data_c)

# Step 1: Combine all files into one DataFrame
combined_df = pd.concat([branch_a, branch_b, branch_c], ignore_index=True)
combined_df.to_csv('step1_combined.csv', index=False)  # Save output of step 1

# Step 2: Convert the 'date' column to datetime with time added as 00:00:00
combined_df['date'] = pd.to_datetime(combined_df['date'], errors='coerce')  # Convert date to datetime with invalid as NaT

# Drop rows with NaN in specific columns and create a copy to avoid warnings
cleaned_df = combined_df.dropna(subset=['transaction_id', 'date', 'customer_id']).copy()
cleaned_df.to_csv('step2_cleaned_corrected.csv', index=False)  # Save output of corrected step 2

# Step 3: Remove duplicates based on transaction_id, keeping the latest date
cleaned_df = cleaned_df.sort_values(by='date').drop_duplicates(subset='transaction_id', keep='last')
cleaned_df.to_csv('step3_duplicates_removed.csv', index=False)  # Save output of step 3

# Step 4: Calculate total sales (quantity * price) for each transaction
cleaned_df['total_sales'] = cleaned_df['quantity'] * cleaned_df['price']

# Step 5: Calculate total sales per branch
total_sales_per_branch = cleaned_df.groupby('branch')['total_sales'].sum().reset_index()
total_sales_per_branch.rename(columns={'total_sales': 'total'}, inplace=True)

# Save the final result
total_sales_per_branch.to_csv('total_sales_per_branch_corrected.csv', index=False)

print("Processing complete. Outputs have been updated and saved.")