require 'net/http'
require 'json'
require 'pry'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

uri = URI("http://data.nba.net/10s/prod/v1/2018/players.json")
http = Net::HTTP.new(uri.host, uri.port)
req = Net::HTTP::Get.new(uri.path)
resp = http.request(req)

json_data = JSON.parse(resp.body)

all_nba_players = json_data["league"]["standard"]

all_nba_players.each do |player|
    NbaPlayer.create(
        first_name: player["firstName"],
        last_name: player["lastName"],
        team_id: player["teamId"].to_i,
        position: player["pos"],
        height_feet: player["heightFeet"],
        height_inches: player["heightInches"],
        person_id: player["personId"]
        )
end






