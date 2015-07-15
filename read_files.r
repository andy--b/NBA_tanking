#### Andy Bowling
#### Tanking and the NBA: A statistical analysis
#### July 2015
#### Take our downloaded/sorted NBA game data files and put them into
#### a single list in R called game_data.


############### IF RUNNING main.r, LEAVE input_data IN COMMENTS ###############
# Read csv which has 3 columns
# First column has team abbrev
# 2nd has start year
# 3rd has end year
# input_data = read.csv("C:/Projects/NBA/teams_formatted.csv", header = F);

read_files = function(input_data){
	# We're storing all of our tables in a single list for easy referencing.
	game_data = list();

	# Assign variables for easy use
	team = input_data[,1];
	start_year = input_data[,2];
	end_year = input_data[,3];

	# Iterate through each team and year, assign list element
	for(te in 1:length(team)) {
		for (y in start_year[te] : end_year[te]) {
			# Set path for reading file, name for list item
			path = paste("C:/Projects/NBA/game_data/", team[te], 
			"/teams_", team[te], "_", as.character(y), "_games_teams_games.csv",
			sep = '')
			nam = paste(team[te], as.character(y), sep = '_');
			
			# Clean up data a little bit. Remove useless/blank columns, get headers right
			# Read as.is, so we don't get factors/levels in our data
			raw_team_data = read.csv(path, header = T, as.is = T);
			
			# Every 21st line in the file (21,42,etc) has headers. remove these
			number_headers = as.integer(nrow(raw_team_data)/21);
			header_lines = c(1:number_headers) * 21
			raw_team_data = raw_team_data[-header_lines,]
			
			# Since we read as.is, we need to convert numerical columns
			for (i in c("G","Tm","Opp","W","L"))
				{raw_team_data[,i] = as.integer(raw_team_data[,i]);}
			
			# team_data 
			team_data = raw_team_data[,c("G","Date","Opponent","Tm","Opp","W","L","Streak")];
			print(paste("Now Reading:", path));
			game_data[[nam]] = team_data;
			y = y + 1;
			}
		te = te + 1;
		}
		
	# Hooray!	
	print("Reading Complete.");
	
	return(game_data);
	}

# Run function with team/start year/end year input data
game_data = read_files(input_data);
