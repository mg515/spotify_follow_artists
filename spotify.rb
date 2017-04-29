require 'rspotify'

# API authentication
RSpotify::authenticate("key", "secret")

# read the artists from the folder structure
artists_list = Dir.entries("D:/Music/")
n = artists_list.length

# there is some empty "." values, not sure why
artists_list.delete_at(n-1)
artists_list.delete_at(0)
artists_list.delete_at(0)

puts artists_list


not_found = Array.new
not_matched = Array.new

artists_list.each do |artist_search|
	
	
	artists = RSpotify::Artist.search(artist_search)
	
	# if artist is not found, skip
	if artists.empty?
		not_found.push(artist_search)
		next
	end
	
	artist = artists.first
	
	# if artist does not exactly match to the #1 search result, skip
	# there is some encoding problem with artist.name obtained from the API, non-english letters get scrambled, need to follow that artists manually
	if artist.name.downcase != artist_search.downcase
		not_matched.push(artist_search)
		next
	end
	
	
	# call the api to follow the artist by id
	puts "working on #{artist.name}"
	puts `curl -X PUT "https://api.spotify.com/v1/me/following?type=artist&ids=#{artist.id}" -H "Accept: application/json" -H "Authorization: Bearer BQBJz250bTP67vzz0LUbEDZGZu6kZlfb7uSiBBfbSOfId6vSOH6es0cE46PJqXQ7OUqTCfYu3xd8Bi4UZIms-KhSr_GfEz0D9Gb9xwNZ0WvJpkIuXohx-AKgpmgXPJ4f9WtkFqiEkllombOPhRncQd-b0Iq5hX6KXyJc4gqlJNsntLdXdN8ns8ZwbU5Aq5Ae9XsCqxPx8eUrZnsst0jyf8dmWyBiOUYDAZRf5UQdrFrliQ"`
	
end

# print artists that did not get followed for on of two reasons
puts "ARTISTS NOT FOUND: #{not_found}"
puts "ARTISTS NOT MATCHED: #{not_matched}"


