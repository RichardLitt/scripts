import pandas as pd

# Read the CSV file
input_file = 'observations-477523.csv'
output_file = 'filtered_output.csv'

# Define the columns to filter by
filter_columns = ['field:eating', 'field:interaction->preyed on', 'field:predating']

# Read the CSV into a pandas DataFrame
df = pd.read_csv(input_file)

# Filter the rows where any of the specified columns are not empty
filtered_df = df.dropna(subset=filter_columns, how='all')

# Save the filtered data to a new CSV file
filtered_df.to_csv(output_file, index=False)

print(f'Filtered data has been saved to {output_file}')

