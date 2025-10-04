//This just picks the round quote out of quotes.txt. quotes.txt has to stay in config or it won't work.
/proc/round_quote()
    var/quote_file = file2text("config/quotes.txt")
    var/list/quotes = splittext(quote_file , "\n")
    GLOB.round_quote = pick(quotes)
