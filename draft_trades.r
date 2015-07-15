#### Andy Bowling
#### Tanking and the NBA: A statistical analysis
#### July 2015
#### Modify aggregate_data table to indicate if team had their draft pick
#### Manually pulled draft trade data from prosportstransactions.com

draft_trades = function(aggr_data) {
	# Set all values to 'Y' by default
	aggr_data[,'has_pick'] = 'Y'
	
	# 1990
	aggr_data[aggr_data[,'team'] == 'WSB' & aggr_data[,'year'] == 1990, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'CLE' & aggr_data[,'year'] == 1990, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'PHI' & aggr_data[,'year'] == 1990, 'has_pick'] = 'N';
	#### NOTE: Pacers traded a conditional pick (ended up being used by Kings at #14)
	
	#1991
	aggr_data[aggr_data[,'team'] == 'PHI' & aggr_data[,'year'] == 1991, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'DET' & aggr_data[,'year'] == 1991, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'PHO' & aggr_data[,'year'] == 1991, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'SAS' & aggr_data[,'year'] == 1991, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'LAL' & aggr_data[,'year'] == 1991, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'POR' & aggr_data[,'year'] == 1991, 'has_pick'] = 'N';
	
	#1992
	aggr_data[aggr_data[,'team'] == 'NJN' & aggr_data[,'year'] == 1992, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'CLE' & aggr_data[,'year'] == 1992, 'has_pick'] = 'N';
	
	#1993
	aggr_data[aggr_data[,'team'] == 'MIA' & aggr_data[,'year'] == 1993, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'SAS' & aggr_data[,'year'] == 1993, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'NYK' & aggr_data[,'year'] == 1993, 'has_pick'] = 'N';
	
	#1994
	aggr_data[aggr_data[,'team'] == 'CHH' & aggr_data[,'year'] == 1994, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'CLE' & aggr_data[,'year'] == 1994, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'ORL' & aggr_data[,'year'] == 1994, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'GSW' & aggr_data[,'year'] == 1994, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'UTA' & aggr_data[,'year'] == 1994, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'HOU' & aggr_data[,'year'] == 1994, 'has_pick'] = 'N';
	#### NOTE: Hawks traded a conditional pick in 1994 that Clippers used at 25
	#### NOTE: Sonics traded a conditional pick in 1994 that Magic used at 27
	#### NOTE: 76ers did a weird swap with #6 pick. Traded over 4 years and got the right
	#### to swap with their own pick. 
	
	#1995
	aggr_data[aggr_data[,'team'] == 'POR' & aggr_data[,'year'] == 1995, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'HOU' & aggr_data[,'year'] == 1995, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'LAL' & aggr_data[,'year'] == 1995, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'NYK' & aggr_data[,'year'] == 1995, 'has_pick'] = 'N';
	
	#1996
	aggr_data[aggr_data[,'team'] == 'WSB' & aggr_data[,'year'] == 1996, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIA' & aggr_data[,'year'] == 1996, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'DET' & aggr_data[,'year'] == 1996, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'SAS' & aggr_data[,'year'] == 1996, 'has_pick'] = 'N';
	
	#1997
	aggr_data[aggr_data[,'team'] == 'DAL' & aggr_data[,'year'] == 1997, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'PHO' & aggr_data[,'year'] == 1997, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'WSB' & aggr_data[,'year'] == 1997, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'LAL' & aggr_data[,'year'] == 1997, 'has_pick'] = 'N';
	#### NOTE: Timberwolves traded a conditional pick that DAL used at 15
	#### NOTE: Hornets traded a conditional pick that Wolves used at 20
	#### NOTE: Knicks traded conditional pick, got it back 3 years later 
	
	#1998
	aggr_data[aggr_data[,'team'] == 'WAS' & aggr_data[,'year'] == 1998, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'NJN' & aggr_data[,'year'] == 1998, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'NYK' & aggr_data[,'year'] == 1998, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'CLE' & aggr_data[,'year'] == 1998, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIA' & aggr_data[,'year'] == 1998, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'PHO' & aggr_data[,'year'] == 1998, 'has_pick'] = 'N';
	#### NOTE: POR traded a conditional pick that Rockets used at 18
	
	#1999
	aggr_data[aggr_data[,'team'] == 'DEN' & aggr_data[,'year'] == 1999, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'NJN' & aggr_data[,'year'] == 1999, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'BOS' & aggr_data[,'year'] == 1999, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'DAL' & aggr_data[,'year'] == 1999, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIN' & aggr_data[,'year'] == 1999, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'PHO' & aggr_data[,'year'] == 1999, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIL' & aggr_data[,'year'] == 1999, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'ORL' & aggr_data[,'year'] == 1999, 'has_pick'] = 'N';
	#### NOTE: Kings traded a conditional pick that DET used at 17
	#### NOTE: 76ers traded a conditional pick that UTA used at 19
	#### NOTE: Blazers traded a conditional pick that Hawks used at 27
	#### NOTE: DET traded a conditional pick that Hawks used at 20

	#2000
	aggr_data[aggr_data[,'team'] == 'GSW' & aggr_data[,'year'] == 2000, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'WAS' & aggr_data[,'year'] == 2000, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'DEN' & aggr_data[,'year'] == 2000, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIN' & aggr_data[,'year'] == 2000, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIA' & aggr_data[,'year'] == 2000, 'has_pick'] = 'N';
	#### sas bulls 24
	#### tor lac 18
	
	#2001
	aggr_data[aggr_data[,'team'] == 'PHO' & aggr_data[,'year'] == 2001, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIN' & aggr_data[,'year'] == 2001, 'has_pick'] = 'N';
	#### Nug Cel 11
	#### pacers warriors 14
	#### nyk hou 18
	#### MIA CLE 20
	#### Mil Orl 22
	### Dal Hou 23
	# LAL Vancouver 27
	
	#2002
	aggr_data[aggr_data[,'team'] == 'MIN' & aggr_data[,'year'] == 2002, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'DAL' & aggr_data[,'year'] == 2002, 'has_pick'] = 'N';
	## ATL Clips 08
	## Pho traded pick then got it back
	## Tor Hou 15
	## Sea nyk 22
	## Bos Pho 22
	
	#2003
	aggr_data[aggr_data[,'team'] == 'MEM' & aggr_data[,'year'] == 2003, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'HOU' & aggr_data[,'year'] == 2003, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'SAC' & aggr_data[,'year'] == 2003, 'has_pick'] = 'N';
	## Atl Mil 8
	## mil sea 14
	## phi bos 20
	## ind atl 21
	# Det traded pick in 1997, got it back in 2001
	
	#2004
	aggr_data[aggr_data[,'team'] == 'NYK' & aggr_data[,'year'] == 2004, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIL' & aggr_data[,'year'] == 2004, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MEM' & aggr_data[,'year'] == 2004, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'DAL' & aggr_data[,'year'] == 2004, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'DET' & aggr_data[,'year'] == 2004, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIN' & aggr_data[,'year'] == 2004, 'has_pick'] = 'N';
	
	#2005
	aggr_data[aggr_data[,'team'] == 'CLE' & aggr_data[,'year'] == 2005, 'has_pick'] = 'N';
	# orl traded pick in 2000, got back in 2001
	# cle cha 13
	# phi tor 16
	# was den 20
	# chi phx 21
	# dal uta 27
	# phx sas 30
	
	#2006
	aggr_data[aggr_data[,'team'] == 'NYK' & aggr_data[,'year'] == 2006, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIL' & aggr_data[,'year'] == 2006, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'MIA' & aggr_data[,'year'] == 2006, 'has_pick'] = 'N';
	# den nyk 20
	# lal phx 21
	# lac njn 22
	# sas nyk 29
	# det por 30
	
	#2007
	aggr_data[aggr_data[,'team'] == 'NYK' & aggr_data[,'year'] == 2007, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'DEN' & aggr_data[,'year'] == 2007, 'has_pick'] = 'N';
	# ind atl 11
	# orl det 15
	# tor cha 22
	# cle phx 24
	# dal 76ers 30
	# Note: Nuggets pick was top 1 protected, left it in
	
	#2008
	aggr_data[aggr_data[,'team'] == 'PHO' & aggr_data[,'year'] == 2008, 'has_pick'] = 'N';
	# atl phx 15
	# dal njn 21
	# lal mem 28
	
	#2009
	aggr_data[aggr_data[,'team'] == 'ORL' & aggr_data[,'year'] == 2009, 'has_pick'] = 'N';
	# mia min 18
	# hou sac 23
	# sas okc 25
	# den okc 26
	# bos min 28
	
	#2010
	aggr_data[aggr_data[,'team'] == 'NYK' & aggr_data[,'year'] == 2010, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'PHO' & aggr_data[,'year'] == 2010, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'CLE' & aggr_data[,'year'] == 2010, 'has_pick'] = 'N';
	# griz traded 12 and got it back
	# chi mil 15
	# bob nugs 16
	# uta min 23
	# den mem 25
	# dal njn 27
	# lal griz 28
	
	#2011
	aggr_data[aggr_data[,'team'] == 'LAC' & aggr_data[,'year'] == 2011, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'NJN' & aggr_data[,'year'] == 2011, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'ATL' & aggr_data[,'year'] == 2011, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'ORL' & aggr_data[,'year'] == 2011, 'has_pick'] = 'N';
	# raps traded 3, got back
	# horn cats 19
	# griz wolves 20
	# lal njn 27
	# mia chi 28
	
	#2012
	aggr_data[aggr_data[,'team'] == 'MIN' & aggr_data[,'year'] == 2012, 'has_pick'] = 'N';
	# njn por 6
	# min hornets 10
	# nyk rockets 16
	# jazz wolves 18
	# lac celtics 22
	# spurs warriors 30
	
	#2013
	aggr_data[aggr_data[,'team'] == 'MEM' & aggr_data[,'year'] == 2013, 'has_pick'] = 'N';
	#raps rockets 12
	# hou hawks 18
	#warriors jazz 21
	
	#2014
	aggr_data[aggr_data[,'team'] == 'NYK' & aggr_data[,'year'] == 2014, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'GSW' & aggr_data[,'year'] == 2014, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'BRK' & aggr_data[,'year'] == 2014, 'has_pick'] = 'N';
	# det hornets 9
	# pels 76ers 10
	# horn bulls 16
	# nets celts 17
	# wiz suns 18
	# mav okc 21
	# por horn 24
	# idn suns 27
	
	#2015
	aggr_data[aggr_data[,'team'] == 'BRK' & aggr_data[,'year'] == 2015, 'has_pick'] = 'N';
	aggr_data[aggr_data[,'team'] == 'LAC' & aggr_data[,'year'] == 2015, 'has_pick'] = 'N';
	# pels rockets 18
	# rockets lakers 27
	
	print("Table Updated");
	return(aggr_data);
	}