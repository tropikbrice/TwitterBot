#!/usr/bin/env ruby

# code promo a utiliser !!
# o1qom

	load '/home/brice/Documents/THP/S02J3/TwitteBot/secret.rb' 

require "twitter"

client_rest = Twitter::REST::Client.new do |config|
  config.consumer_key        = Cons_key # "YOUR_CONSUMER_KEY"
  config.consumer_secret     = Cons_secret #{}"YOUR_CONSUMER_SECRET"
  config.access_token        = Acc_token #{}"YOUR_ACCESS_TOKEN"
  config.access_token_secret = Acc_token_secret #{}"YOUR_ACCESS_SECRET"
end


# STREAMING
client_stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = Cons_key # "YOUR_CONSUMER_KEY"
  config.consumer_secret     = Cons_secret #{}"YOUR_CONSUMER_SECRET"
  config.access_token        = Acc_token #{}"YOUR_ACCESS_TOKEN"
  config.access_token_secret = Acc_token_secret #{}"YOUR_ACCESS_SECRET"
end

# API REST
search_options = {
  result_type: "recent",
  geocode: "48.867638,2.37794,1mi",
  count: 30 # a gerer en fonction du take
  #,until: 2017-01-01
}

# client_rest.search("", search_options).take(3).each do |tweet|
# 	puts "#{tweet.user.screen_name}: \n #{tweet.text}"
# 	puts "------------"
# end


#topics a surveiller
topics = "faim,uber"
#API STREAMING
stream_options ={
	#locations: "-122.75,36.8,-121.75,37.8"
	#track: topics.join(",") ,
	track: topics ,
	geocode: "48.8534,2.3488,2mi",
	result_type: "recent"
}

def filter_twit(stream_options, client_rest, client_stream )

	#on ecoute twitter :
	client_stream.filter( stream_options ) do |tweet|

		if tweet.is_a?(Twitter::Tweet)

			#gestion des erreurs car marre des deja retweet!
			begin
				puts "#{tweet.user.screen_name}: \n #{tweet.text}"
				puts "--------------------"

				#retweeter
				#client_rest.retweet!(tweet)

				#liker le tweet
				client_rest.favorite([tweet])

				#follow le gars
				client_rest.follow([tweet.user])

				#tweeter en le mentionnant :
				#client_rest.update("hello @#{tweet.user.screen_name}, tu peux manger pas cher avec mon code promo UberEats : o1qom")

			rescue Twitter::Error::Forbidden => e
				puts "!!!!!!!!!!!!!!!!!!!!!!!!!!"
				puts "brice : tweet deja fait"
				puts "!!!!!!!!!!!!!!!!!!!!!!!!!!"
				#puts "Exception Class: #{ e.class.name }"
				#puts "Exception Message: #{ e.message }"
				#puts "Exception Backtrace: #{ e.backtrace }"
			end
		end#fin if
	end
end

filter_twit(stream_options, client_rest, client_stream)