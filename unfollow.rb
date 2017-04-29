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
	puts `curl -X DELETE "https://api.spotify.com/v1/me/following?type=artist&ids=#{artist.id}" -H "Accept: application/json" -H "Authorization: Bearer BQBqPP2CAtbwzVt-tL3JEZtH0P4wPqu-K_1QxKM8v34vSjRXSREFEf6FWSvyVo8GZh-rIew-n6WR8ZTeSvza2U-YtRw7PUDvfF0Kpn-xjePngtys68o9rENfXt0xLzNnXjJhg-myA8mtSIeM2VdbE4kvVg8XTKn2ARFlxRzdehfpVubyidwabcBQq16FWxO699Papx7gS7Aoi0XoT0KwGPJ5_92aofnC8X-biGnVacOpCg"`
	
	
end