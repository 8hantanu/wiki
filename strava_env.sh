import requests
import json
from datetime import datetime

# Replace these with your actual values
STRAVA_CLIENT_ID = "YOUR_CLIENT_ID"
STRAVA_CLIENT_SECRET = "YOUR_CLIENT_SECRET"
STRAVA_REFRESH_TOKEN = "YOUR_REFRESH_TOKEN"

print("=" * 60)
print("Testing Strava API Connection")
print("=" * 60)

# Get new access token using refresh token
auth_url = "https://www.strava.com/oauth/token"
auth_data = {
    'client_id': STRAVA_CLIENT_ID,
    'client_secret': STRAVA_CLIENT_SECRET,
    'refresh_token': STRAVA_REFRESH_TOKEN,
    'grant_type': 'refresh_token'
}

print("\n1. Requesting new access token from Strava...")
auth_response = requests.post(auth_url, data=auth_data)

print(f"   Status code: {auth_response.status_code}")

if auth_response.status_code != 200:
    print(f"   ERROR: {auth_response.text}")
    exit(1)

auth_json = auth_response.json()
access_token = auth_json['access_token']
print("   ✓ Successfully obtained access token")

# Fetch activities for 2026
print("\n2. Fetching activities from Strava...")
headers = {'Authorization': f'Bearer {access_token}'}
activities_url = "https://www.strava.com/api/v3/athlete/activities"

# Get activities after January 1, 2026
after_timestamp = int(datetime(2026, 1, 1).timestamp())
params = {
    'after': after_timestamp,
    'per_page': 200
}

all_activities = []
page = 1

while True:
    params['page'] = page
    response = requests.get(activities_url, headers=headers, params=params)
    
    if response.status_code != 200:
        print(f"   ERROR fetching activities: {response.status_code}")
        print(f"   Response: {response.text}")
        exit(1)
    
    activities = response.json()
    
    if not activities:
        break
    
    print(f"   Fetched {len(activities)} activities from page {page}")
    all_activities.extend(activities)
    page += 1
    
    # Safety break
    if page > 5:
        break

print(f"   ✓ Total activities fetched: {len(all_activities)}")

# Filter for runs and calculate total distance
print("\n3. Processing running activities...")
total_distance_meters = 0
run_count = 0

for activity in all_activities:
    if activity['type'] in ['Run', 'VirtualRun']:
        distance_km = activity['distance'] / 1000
        date = activity['start_date'][:10]
        name = activity['name']
        print(f"   - {date}: {name} ({distance_km:.2f} km)")
        total_distance_meters += activity['distance']
        run_count += 1

# Convert to kilometers
total_km = total_distance_meters / 1000

print("\n" + "=" * 60)
print("RESULTS")
print("=" * 60)
print(f"Total runs: {run_count}")
print(f"Total distance: {total_km:.2f} km")
print(f"Goal: 1000 km")
print(f"Progress: {(total_km/1000)*100:.1f}%")
print(f"Remaining: {max(1000-total_km, 0):.2f} km")

# Prepare stats object
stats = {
    'total_km': round(total_km, 2),
    'run_count': run_count,
    'last_updated': datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC'),
    'year': 2026,
    'goal_km': 1000
}

# Write to JSON file
with open('running-stats.json', 'w') as f:
    json.dump(stats, f, indent=2)

print("\n✓ Stats saved to running-stats.json")
print("=" * 60)
