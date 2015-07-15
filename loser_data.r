#### Andy Bowling
#### Tanking and the NBA: A statistical analysis
#### July 2015
#### Takes data.frame from aggregate_data.r and selects only the
#### losers based on certain criteria provided below



############## IF RUNNING main.r, LEAVE THE FOLLOWING IN COMMENTS #############
# Specify "worse than x wins from position y" criteria
# e.g. number_of_wins = 4 and from position = 22
# would return teams at MOST 4 wins ahead of the 22nd best team
# at the midpoint of the season. For "from last place",
# use negative values. e.g. -2 references the 2nd worst team. 0 is invalid.
# WARNING: Make sure you provide legal value for ALL seasons.
# If you use "30" or "-30" in a year with 29 teams, you'll get an error
# number_of_wins = 6;
# from_this_place = -5;

# Specify start and end year
# start_year = 1990;
# end_year = 2015;

loser_data_fn = function(aggr_data, number_of_wins, from_this_place) {
	
	start_year = min(aggr_data[,'year'])
	end_year = max(aggr_data[,'year'])
	
	# Initialize values in mid_group column to W for winner
	aggr_data[,'mid_group'] = 'W';
	
	# Loop through each year, append to loser_data frame
	for (year in start_year:end_year) {
	
		print(paste('Now adding losers from ', as.character(year)));
		
		# Create data frame for 'year'
		data_for_year = aggr_data[aggr_data[,"year"] == year,];
		
		# Calculate maximum_wins, which is the most wins a team can have on the loser table
		# run if statement on from_this_place to handle positive (aka position from top) and
		# negative (aka position from bottom) inputs
		if (from_this_place > 0) {maximum_wins = data_for_year[from_this_place,"mid_wins"]
		+ number_of_wins}
		else {
			position = nrow(data_for_year) + from_this_place + 1;
			maximum_wins = data_for_year[data_for_year[,'mid_rank'] == position,"mid_wins"] + number_of_wins;
			}
		
		data_for_year[data_for_year[,"mid_wins"] <= maximum_wins,'mid_group'] = 'L';
		# Apply changes to aggr_data table
		aggr_data[aggr_data[,"year"] == year,] = data_for_year
		
		}
		
	# print message upon completion
	print("Loser data complete");
	
	# return aggr_data
	return(aggr_data);	
	}
	
aggr_data = loser_data_fn(aggr_data, number_of_wins,from_this_place);