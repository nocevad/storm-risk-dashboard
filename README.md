\# Storm Risk Dashboard



An end-to-end data pipeline that analyzes historical U.S. storm risk at the county level, combining 70 years of FEMA disaster declarations with 172 years of Atlantic hurricane track data.



\## What it does

\- Fetches FEMA disaster declaration data from the FEMA OpenFEMA API

\- Parses NOAA HURDAT2 Atlantic hurricane database (1851-2023)

\- Computes county-level hurricane susceptibility scores using Haversine distance calculations

\- Builds enhanced risk scores combining disaster frequency and hurricane exposure

\- Exports a 365-frame animated GIF showing historical storm risk for every day of the year

\- Includes an interactive date lookup tool to check risk for any day/month combination



\## Data Sources

\- FEMA OpenFEMA API: https://www.fema.gov/api/open/v2/DisasterDeclarationsSummaries

\- NOAA HURDAT2: https://www.nhc.noaa.gov/data/hurdat/hurdat2-1851-2023-051124.txt

\- US Census County Reference: https://www2.census.gov/geo/docs/reference/codes2020/national\_county2020.txt

\- Plotly County GeoJSON: https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json



\## Database

MySQL database with 5 tables:

| Table | Records |

|---|---|

| counties | 3,324 |

| fema\_disasters | 69,634 |

| hurricane\_susceptibility | 2,557 |

| county\_day\_features | 67,826 |

| monthly\_risk | 60,849 |



\## Notebooks

| Notebook | Purpose |

|---|---|

| 01\_setup\_and\_test\_connection | Fetch FEMA data from API and load into MySQL |

| 02\_ingest\_hurricane | Parse HURDAT2 and compute county susceptibility scores |

| 03\_feature\_engineering | Build enhanced risk scores and monthly aggregations |

| 04\_visualize\_check | Single frame spot check and validation |

| 05\_export\_gif\_dayofyear | Build 365 frame GIF and interactive date lookup |

| 05\_export | For development testing |



\## Setup Instructions



\### Requirements

\- Python 3.x

\- MySQL Server 8.0+

\- See requirements.txt for Python libraries



\### Installation

1\. Clone this repository

2\. Create a virtual environment: `python -m venv venv`

3\. Activate it: `venv\\Scripts\\activate`

4\. Install dependencies: `pip install -r requirements.txt`

5\. Create a `.env` file with your MySQL credentials (see `.env.example`)

6\. Run `sql/schema.sql` in MySQL to create the database and tables

7\. Run notebooks in order 01 through 05



\## Output

A 2.35MB animated GIF showing U.S. historical storm risk for all 365 days of the year,

with Gulf Coast, Florida, and Carolina counties showing highest risk during hurricane season.

```



Save that file.



---



\### Step 2 — Create requirements.txt



Create a new file at:

```

C:\\Projects\\storm\_risk\\requirements.txt

