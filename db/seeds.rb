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

  pie = rand(1..20)


  # uri = URI("http://stats.nba.com/stats/playerdashboardbyyearoveryear/?measureType=Advanced&perMode=PerGame&plusMinus=N&paceAdjust=N&rank=N&leagueId=00&season=2017-18&seasonType=Regular+Season&playerId=#{player["personId"]}&outcome=&location=&month=0&seasonSegment=&dateFrom=&dateTo=&opponentTeamId=0&vsConference=&vsDivision=&gameSegment=&period=0&shotClockRange=&lastNGames=0")
  # http = Net::HTTP.new(uri.host, uri.port)
  # req = Net::HTTP::Get.new(uri.path)
  # resp = http.request(req)
  # puts resp
  #
  # json_data = JSON.parse(resp)
  # pie = json_data["resultSets"][0][rowSet][0][24]

if (player["nbaDebutYear"] != "" && player["jersey"] != "" && player["yearsPro"] != "0" && player["yearsPro"] != "1")



    NbaPlayer.create(
        first_name: player["firstName"],
        last_name: player["lastName"],
        team_id: player["teamId"].to_i,
        position: player["pos"],
        height_feet: player["heightFeet"],
        height_inches: player["heightInches"],
        person_id: player["personId"],
        pie: pie
        )
    end
end

oren = User.create(username: "odog", name: "Oren", height: 72, age: 40)
anthony = User.create(username: "abuckets", name: "Anthony", height: 70, age: 26)
jimmy = User.create(username: "jimmy", name: "Jim", height: 54, age: 30)
john = User.create(username: "john", name: "John", height: 76, age: 36)
will = User.create(username: "willimnot", name: "Will", height: 75, age: 40)
susanna = User.create(username: "susanna", name: "Susanna", height: 64, age: 27)
jared = User.create(username: "jhandles", name: "Jared", height: 73, age: 22)
august = User.create(username: "amoney", name: "August", height: 68, age: 24)
essa = User.create(username: "essa", name: "Essa", height: 69, age: 23)
bruno = User.create(username: "bgthaog", name: "Bruno", height: 68, age: 25)
brittany = User.create(username: "brittany", name: "Brittany", height: 64, age: 24)

group1 = Group.create(name: "Bucket Patrol")
group2 = Group.create(name: "Kickin' Rocks")

group1.users = [oren, anthony, jimmy, john, will, susanna, jared, august, essa, bruno, brittany]
group2.users = [oren, anthony, jimmy, john, will, susanna, jared, august, essa, bruno, brittany]
