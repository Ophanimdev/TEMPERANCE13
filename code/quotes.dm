//This just picks the round quote out of quotes.txt. quotes.txt has to stay in config or it won't work.
/proc/round_quote()
    var/quote_file = file2text("config/quotes.txt")
    var/list/quotes = splittext(quote_file , "\n")

	//Put this here so that we don't get a null quote or some other dumb bug. 

	if(!quotes.len == 0)
    	GLOB.round_quote = pick(quotes)
	else
		GLOB.round_quote = "God hates you."
