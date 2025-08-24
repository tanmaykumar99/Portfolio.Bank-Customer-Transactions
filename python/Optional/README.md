# Geocoding API Calls

This repository contains a Jupyter Notebook that demonstrates how to make **geocoding API calls** to convert addresses into geographic coordinates (latitude/longitude) and optionally perform reverse geocoding. This is an optional step for this project, in case one wants to clean and standardise the entire location dataset for analysis purposes. 

NOTE: Please bear in mind that this may be a costly setup (With the Google Maps API approach), or a time-consuming one (with the Nominatim approach). 

## Features
- Forward geocoding: Convert addresses into coordinates.
- Reverse geocoding: Convert coordinates into human-readable addresses.
- Example API integration using Python.
- Clean, step-by-step Jupyter Notebook format.

## Requirements
Make sure you have the following installed:

- Python 3.8+
- Jupyter Notebook
- Required Python libraries:
  - `requests`
  - `pandas`
  - `geopandas` (optional, for spatial data handling)
  - `notebook`

You can install dependencies with:

```bash
pip install -r requirements.txt
```

## API Key Setup

Depending on the geocoding provider you’re using (e.g., Google Maps/Nominatim), you may need an API key.

### Step 1: Create an account with your provider.
### Step 2: Obtain an API key.
### Step 3: Add it to the notebook (either as an environment variable or directly in the code).

## Desired Outputs

1. Latitude/Longitude coordinates from addresses.
2. Addresses from coordinates.
3. Optional CSV/Excel exports for results.