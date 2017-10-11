#!/usr/bin/env ruby

load '/home/brice/Documents/THP/S02J3/TwitteBot/secret.rb' 

require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = Cons_key # "YOUR_CONSUMER_KEY"
  config.consumer_secret     = Cons_secret #{}"YOUR_CONSUMER_SECRET"
  config.access_token        = Acc_token #{}"YOUR_ACCESS_TOKEN"
  config.access_token_secret = Acc_token_secret #{}"YOUR_ACCESS_SECRET"
end

# mon 1er tweet sur mon compte !
#client.update('T like Tweet ? no like Terminal !!')

# supprimer tweet :
#client.destroy_tweet 918066295006027776

# client.search("#hackaton").take(50).each do |tweet|
# 	puts tweet.text
# end

# 94 rue jean pierre timbaud paris
# 48.867638,2.37794

search_options = {
  result_type: "recent",
  geocode: "48.867638,2.37794,1mi",
  count: 30 # a gerer en fonction du take
  #,until: 2017-01-01
}

client.search("", search_options).take(3).each do |tweet|
	puts "#{tweet.user.screen_name}: \n #{tweet.text}"
	puts "------------"
end

client.follow("gem")