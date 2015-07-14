#### Andy Bowling
#### Takes data.frame from aggregate_data.r and selects only the
#### losers based on certain criteria provided below



#### SET THESE BEFORE RUNNING FUNCTION
# Specify "worse than x wins from position y" criteria
# e.g. number_of_wins = 4 and from position = 22
# would return teams at MOST 4 wins ahead of the 22nd best team
# at the midpoint of the season. For "from last place",
# use negative values. e.g. -2 references the 2nd worst team


# WARNING: Make sure you provide legal value for ALL seasons.
# If you use "30" in a year with 29 teams, you'll get an error
number_of_wins = 10
from_this_place = -3

# Specify start and end year
start_year = 1990
end_year = 2015

loser_list = function(number_of_wins,from_this_place,start_year,end_year) {
	
	

	}