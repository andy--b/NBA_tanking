#### Andy Bowling
#### Tanking and the NBA: A statistical analysis
#### July 2015
#### Main r file for analyzing tanking. Run this after running scrape_data.py

################### SET THE FOLLOWING BEFORE RUNNING #####################

# Path where your R files live
setwd('c:/projects/nba');

# Read csv that has team names and year ranges, or pass through list from
# read_files function in read_files.r
input_data = read.csv("C:/Projects/NBA/teams_formatted.csv", header = F);

# Specify where the cut off point is. Number is games from end of season.
# e.g. In an 82 game season, cutoff = 28 would take record after 54 games
cutoff = 28

# Specify "worse than x wins from position y" criteria for determining losers.
# e.g. number_of_wins = 4 and from position = 22
# would return teams at MOST 4 wins ahead of the 22nd best team
# at the midpoint of the season. For "from last place",
# can negative values. e.g. -2 references the 2nd worst team. 0 is invalid.
# WARNING: Make sure you provide legal value for ALL seasons.
# If you use "30" or "-30" in a year with 29 teams, you'll get an error
number_of_wins = 6;
from_this_place = -5;

# Specify start and end year for analysis
start_year = 1990;
end_year = 2015;

################### Step 1: Read Data, change global settings #################

# Set global R parameter to pause between graphs
par(ask = TRUE);

# Read files
source('read_files.r');
# Aggregate data by team by season
source('aggregate_data.r');
# Fill in info for has_pick column in aggr_data
source('draft_trades.r');
# Update column for winning/losing teams at cutoff point
source('loser_data.r');


###################### Step 2: Regression modeling #############################

# Create a regression model testing actual_v_expected wins based on midseason win percent and
# whether or not team has possesion of own 1st round pick
model_1 = lm(aggr_data[,'actual_v_expected'] ~ aggr_data[,'mid_percent']+ factor(aggr_data[,'has_pick']))



############### Step 3: Splitting data based on midseason record ###############

# Run analysis comparing winning teams at midseason with losing teams
winner_performance = winner_data[,'actual_v_expected'];
loser_performance = loser_data[,'actual_v_expected'];

# Run analysis comparing bad teams with and without 1st round pick
yes_pick = loser_data[loser_data[,'has_pick'] == 'Y','actual_v_expected'];
no_pick = loser_data[loser_data[,'has_pick'] == 'N','actual_v_expected'];

# qqplot to visually check for normality
qqnorm(yes_pick, main = 'QQ normal plot for teams with draft pick');
qqnorm(no_pick, main = 'QQ normal plot for teams without draft pick');

