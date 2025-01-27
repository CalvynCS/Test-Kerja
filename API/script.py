import requests
import pandas as pd

def fetch_data_by_country(country):
    """
    Fetch data from the API by filtering with the given country.
    """
    url = f'http://universities.hipolabs.com/search?country={country.replace(" ", "%20")}'
    response = requests.get(url)

    if response.status_code == 200:
        return response.json()
    else:
        print(f"Error: Unable to fetch data. HTTP Status Code: {response.status_code}")
        return []

def create_dataframe(data):
    """
    Create a pandas DataFrame from the fetched data.
    """
    df = pd.DataFrame(data)
    # Keep only the desired columns
    df = df[["name", "web_pages", "country", "domains", "state-province"]]
    df.columns = ["Name", "Web pages", "Country", "Domains", "State Province"]
    return df

def filter_no_state_province(df):
    """
    Filter rows where 'State Province' is not available (NaN or None).
    """
    filtered_df = df[df["State Province"].isna()]
    return filtered_df

# Input the country to filter
country = input("Enter the country to search: ")

# Fetch data from API
raw_data = fetch_data_by_country(country)

if raw_data:
    # Create DataFrame
    df = create_dataframe(raw_data)

    # Display the full DataFrame
    print("\nComplete DataFrame:")
    print(df)

    # Filter rows with no state-province
    no_state_province_df = filter_no_state_province(df)

    # Display filtered DataFrame
    print("\nDataFrame with no State Province:")
    print(no_state_province_df)
else:
    print("No data fetched.")