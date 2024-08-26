import csv
import yaml

# Load the CSV
with open('your_file.csv', 'r') as csv_file:
    reader = csv.DictReader(csv_file)
    data = list(reader)

# Convert and write the data to YAML
with open('output.yaml', 'w') as yaml_file:
    yaml.dump(data, yaml_file)
