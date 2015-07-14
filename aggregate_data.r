#### Andy Bowling
#### Takes list created in read.files.r and returns
#### a single data.frame with all teams for all years
#### Includes total w/l/percent, midpoint w/l/percent
#### (specified by 'cutoff' - which is # of games before end of season)
#### And 'actual_v_expected', which extrapolates total wins from midseason wins.


#### SPECIFY THESE BEFORE RUNNING SCRIPT
# Specify where the cut off point is. Number is games from end of season.
# e.g. In an 82 game season, cutoff = 28 would take record after 54 games
cutoff = 28

# Read csv that has team names and year ranges, or pass through list from
# read_files function in read_files.r
input_data = read.csv("C:/Projects/NBA/teams_formatted.csv", header = F);

aggregate_data = function(input_data,cutoff) {

	# Assign variables for easy use
	team = input_data[,1];
	start_year = input_data[,2];
	end_year = input_data[,3];

	# Initialize data_frame
	aggr_data = data.frame(team = character(0), year = integer(0), 
	mid_games = integer(0), mid_wins = integer(0), mid_losses = integer(0), 
	mid_percent = numeric(0), expected_wins = numeric(0), total_wins = integer(0), 
	total_losses = integer(0), total_percent = numeric(0), 
	actual_v_expected = numeric(0), has_pick = character(0), stringsAsFactors = F);
	 
	# Create counting variable for aggr_data
	iter = 1
	 
	# Iterate through each team in game_data list, calculate metrics, add to aggr_data
	for(te in 1:length(team)) {
		for (y in start_year[te] : end_year[te]) {
			this_team = paste(team[te], y, sep = '_');
			
			# Calculate midseason wins, percentage, expected wins, 
			# total wins, total percentage, diff
			this_team_data = game_data[[this_team]];
			midseason_games = this_team_data[(nrow(this_team_data) - cutoff),'G'];
			midseason_wins = this_team_data[(nrow(this_team_data) - cutoff),'W'];
			midseason_losses = this_team_data[(nrow(this_team_data) - cutoff),'L'];
			midseason_percent = midseason_wins / (midseason_losses + midseason_wins);
			expected_wins = midseason_wins + (midseason_percent * cutoff)
			total_wins = this_team_data[nrow(this_team_data),'W'];
			total_losses = this_team_data[nrow(this_team_data),'L'];
			total_percent = total_wins / (total_losses + total_wins);
			actual_v_expected = total_wins - expected_wins
			
			# Append our variables to aggr_data
			aggr_data[iter,'team'] = as.character(team[te]);
			aggr_data[iter,'year'] = y;
			aggr_data[iter,'mid_games'] = midseason_games;
			aggr_data[iter,'mid_wins'] = midseason_wins;
			aggr_data[iter,'mid_losses'] = midseason_losses;
			aggr_data[iter,'mid_percent'] = midseason_percent
			aggr_data[iter,'expected_wins'] = expected_wins;
			aggr_data[iter,'total_wins'] = total_wins;
			aggr_data[iter,'total_losses'] = total_losses;
			aggr_data[iter,'total_percent'] = total_percent; 
			aggr_data[iter,'actual_v_expected'] = actual_v_expected;
			
			print(paste("Now Reading:", this_team));
			
			# increment
			iter = iter + 1;
			y = y + 1;
		}
		te = te + 1;
	}

	# Sort data frame by year and mid season wins
	aggr_data = aggr_data[order(aggr_data[,"year"],-aggr_data[,"mid_wins"]),]

	print("Reading complete.")
	
	return(aggr_data);
	}
	
aggr_data = aggregate_data(input_data,cutoff)