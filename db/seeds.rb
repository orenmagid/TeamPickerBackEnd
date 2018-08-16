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


  # uri = URI("http://stats.nba.com/stats/playerdashboardbyyearoveryear/?measureType=Advanced&perMode=PerGame&plusMinus=N&paceAdjust=N&rank=N&leagueId=00&season=2017-18&seasonType=Regular+Season&playerId=#{player["personId"]}&outcome=&location=&month=0&seasonSegment=&dateFrom=&dateTo=&opponentTeamId=0&vsConference=&vsDivision=&gameSegment=&period=0&shotClockRange=&lastNGames=0")
  # http = Net::HTTP.new(uri.host, uri.port)
  # req = Net::HTTP::Get.new(uri.path)
  # resp = http.request(req)
  # puts resp
  #
  # json_data = JSON.parse(resp)
  # pie = json_data["resultSets"][0][rowSet][0][24]
  # puts pie
    if (player["yearsPro"] != "0" && player["jersey"] != "" && player["nbaDebutYear"] != "")
    NbaPlayer.create(
        first_name: player["firstName"],
        last_name: player["lastName"],
        team_id: player["teamId"].to_i,
        position: player["pos"],
        height_feet: player["heightFeet"],
        height_inches: player["heightInches"],
        person_id: player["personId"],
        pie: [1...20].sample
    
    end
end
