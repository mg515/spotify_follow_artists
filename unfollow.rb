require 'rspotify'

RSpotify::authenticate("key", "secret")

#artists_list = ["Ben Frost"]
artists_list = Dir.entries("D:/Music/")
n = artists_list.length

artists_list.delete_at(n-1)
artists_list.delete_at(0)
artists_list.delete_at(0)

puts artists_list

artists_list.each do |artist_search|
	
	
	
	puts artist_search
	
	artists = RSpotify::Artist.search(artist_search)
	
	if artists.empty?
		next
	end
	
	artist = artists.first
	puts "working on #{artist.name}"
	puts `curl -X DELETE "https://api.spotify.com/v1/me/following?type=artist&ids=#{artist.id}" -H "Accept: application/json" -H "Authorization: Bearer AUTHTOKEN"`
	
	
end
