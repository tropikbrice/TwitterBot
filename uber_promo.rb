#!/usr/bin/env ruby

# code promo a user 
# o1qom

load '/home/brice/Documents/THP/S02J3/TwitteBot/secret.rb' 

require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = Cons_key # "YOUR_CONSUMER_KEY"
  config.consumer_secret     = Cons_secret #{}"YOUR_CONSUMER_SECRET"
  config.access_token        = Acc_token #{}"YOUR_ACCESS_TOKEN"
  config.access_token_secret = Acc_token_secret #{}"YOUR_ACCESS_SECRET"
end