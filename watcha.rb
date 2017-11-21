require 'httparty'
require 'rest-client'
require 'json'
require 'awesome_print'
require 'csv'

headers = {
  cookie: "__uvt=; fbm_126765124079533=base_domain=.watcha.net; _s_guit=508bb4373bb1bf9d9dbd16f0577ea37acb22e144c0bf001670f5a6a2d77a; _ga=GA1.2.1206951641.1511236612; _gid=GA1.2.2024715040.1511236612; uvts=6n2AmW1JQsmNI6D0; fbsr_126765124079533=OV-5IKuG8dcxeCBpnJt_sJnGqaw9CvegkZcZhCR4H5w.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUFieE84dUZiaHF4bndkVDVPWTNIaUMzNEU5SnFSYUpMbUlYV1JTNFFKa1lWNlhRbjBHOFc2UTVaVldqeW9PaW5oTFQ0UXhUeXdjdmdicVNqRU9CWUd3Y25vMW00QW9ITXY3ajU5T1h5Y0pMVEpmSWJlUFB5bGNaUkx5QUtKTmhJc2pQNlNuZ1d6WDhtWGttWjNtcWtJYjFzQ2hJaURRaWRhTnVzdFloNGVKQUFncHVNWVI1UDZJRUVWRVZySEVscER1YUJQYWVwQTVwTE5nNDgtTTJwOHNmZFZaaC1ZaGZXZllOLVZHUmlENzNZSDdFTE84QUE0RFZZMFJQMmRNVzJzZFJuR09TbkxCMzhHcURkU0owVTh5RC1fVWlRRzE1RGpTNXozYlFMUl9MX2Q1bFhFQWtkMzFTeU5qRzlWT0pqV09GeTF6NGhoQVRqNERLLVZ5cGVRSCIsImlzc3VlZF9hdCI6MTUxMTIzNzg5MCwidXNlcl9pZCI6IjY5MDMyNTQ2NiJ9; _guinness_session=dU0rL2F0KzEvb1FPNGdZekgvdHFxbXdXakc0Q2c3WWlpUW1XanVmOC9JMU9nMjlpMzFabHlqMFpvWVRIcU1MT1BqOEw5S1F5R1ZaZk5pOUpwYkthQWowUkFjcjZrNGRhbW5iSGUreUN2aXgxbUdDdFlaUmRSWG5lWHIyQXEycUdsRmRITzBmM3R1KzBsYUJyTWhKVDhUTnNPaDI3azN3a2x6b0NKMDNuS3hRS2puVmwvUHU5ZWtaNVpMVzZ5b3Z1LS1RL3FvMFovY0NFcjFCeTh4MkkxQlF3PT0%3D--3b43b36a4effbe4c9f21feeab9577bc8836001d8"
}
res = HTTParty.get(
  "https://watcha.net/boxoffice.json",
  :headers => headers
)
watcha = JSON.parse(res.body)
list = watcha["cards"]
list.each do |item|
  movie = item["items"].first["item"]
  title = movie["title"]
  image = movie["poster"]["large"]
  desc = movie["interesting_comment"]["text"] if movie["interesting_comment"]
  CSV.open("movie_list.csv", "a+") do |csv|
    csv << [title, image, desc]
  end
end


# title = watcha["cards"].first["items"].first["item"]["title"]
# image = watcha["cards"].first["items"].first["item"]["poster"]["large"]
# desc = watcha["cards"].first["items"].first["item"]["interesting_comment"]["text"]

# movie = i["items"][0]["item"]
# title = movie["title"]
# image = movie["poster"]["large"]
# desc = movie["interesting_comment"]["text"] if movie["interesting_comment"]
# CSV.open("movie_list.csv", "a+") do |csv|
#   csv << [title, image, desc]
# end






# ap watcha["cards"][0]["items"][0]["item"]["title"]
# watch["cards"].each do |card|
#    movie = card["items"].first["item"]
#    title = movie["title"]
#    image = movie["poster"]["medium"]
#    desc = movie["interesting_comment"]["text"]
#    puts title, image, desc
   # File.open("./images/#{movie["title"]}.jpg", "wb") do |file|
   #     file << open(poster).read
   # end
# end
# CSV.open("path/to/file.csv", "wb") do |csv|
#   csv << ["row", "of", "CSV", "data"]
# end
