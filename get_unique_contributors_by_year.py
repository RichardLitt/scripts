import pandas as pd

def find_supporters_per_year(file_path):
    """Finds the number of unique supporters who contributed in each calendar year."""
    # Load the CSV file into a pandas DataFrame
    df = pd.read_csv(file_path)

    # Convert 'Date' to datetime, letting pandas handle the parsing
    df['Date'] = pd.to_datetime(df['Date'], errors='coerce')

    # Extract the year from 'Date'
    df['Year'] = df['Date'].dt.year

    # Get all unique years in the data
    unique_years = df['Year'].unique()

    # Create a dictionary to store the number of unique supporters per year
    supporters_per_year = {}

    # Loop through each unique year and count the unique 'Supporter Id'
    for year in unique_years:
        supporters_count = df[df['Year'] == year]['Supporter Id'].nunique()
        supporters_per_year[year] = supporters_count

    # Print the number of unique supporters for each year
    for year, count in sorted(supporters_per_year.items()):
        print(f"Number of unique supporters who contributed in {year}: {count}")

# Usage
file_path = 'your.csv'  # Replace with your actual file path
find_supporters_per_year(file_path)