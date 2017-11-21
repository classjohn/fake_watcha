# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach(Rails.root.join('movie_list.csv')) do |row|
  Movie.create(
    title: row[0],
    remote_image_url_url: row[1],
    desc: row[2]
  )
end
