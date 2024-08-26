import json
# Seems weird to import all
from pyinaturalist import get_observations

response = get_observations(id=237526754)

#Pretty print
print(json.dumps(response, indent=4, default=str))

# I suggest piping this response to a text file, as it's too big for the printer. 