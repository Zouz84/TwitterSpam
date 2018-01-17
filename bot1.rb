require 'twitter'

require 'pry'

# quelques lignes qui enregistrent les clés d'APIs

client = Twitter::REST::Client.new do |config|

  config.consumer_key        = ""

  config.consumer_secret     = ""

  config.access_token        = ""

  config.access_token_secret = ""

end

p client

# Ca va tweeter Bonjour Monde #WARMUP --> Pour correcteur: Si ça bug, veuillez supprimer cette partie jusqu'a # LIKE LES POST D'UNE LISTE DE NOMS. THX

def Hello(tweet)
  client.update(tweet)
end

# Ca va follow un array de personnes #WARMUP

def follow(person)
  person.each do |person|
  client.follow(person)
  end
end

# LIKE LES POST D'UNE LISTE DE NOMS 

myArray = ["@HiTech_lexpress","@bcondominas"] #array de noms

myArray.each do |x|   

tweets = client.user_timeline(x) #va chercher les tweets les plus recent par ID

puts (tweets) #inscrit l'ID du tweet 

client.favorite(tweets) #aime les tweets de la liste créée 

end

=begin

#scan les tweets avec le #ruby, prend les 3 derniers et leur tweet "@username : Hey I love Ruby too"

client.search('#ruby').take(3).each do |tweet| 

 client.update("@#{tweet.user.screen_name}: Hey I love Ruby too :)")

end

=end

=begin #test pour envoyer des tweets aux "journalistes" / ne marche pas

tweet = "#{name} Yo" 

journalist = ['@seize84', '@elodie_legeay']

journalist.each do |tweet|

client.update(tweet)

end

=end

#Streaming de tweet

client2 = Twitter::Streaming::Client.new do |config|

  config.consumer_key        = ""

  config.consumer_secret     = ""

  config.access_token        = ""

  config.access_token_secret = ""

end

p client

=begin --- Stream all tweets & RT with coffee and tea in it 

topics = ["coffee", "tea"]

client.filter(track: topics.join(",")) do |object|

  puts object.text if object.is_a?(Twitter::Tweet)

end

=end 

