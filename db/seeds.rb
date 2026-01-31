# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'pry'

def fetch(url)
  JSON.parse(OpenURI.open_uri(url).read)
end

Season.delete_all

seasons_url = 'http://sports.core.api.espn.com/v2/sports/basketball/leagues/nba/seasons?limit=100'
puts 'Requesting seasons list'
seasons = fetch(seasons_url)

seasons['items'].take(3).each do |season|
  url = season['$ref']
  season_info = fetch(url)
  ssn = Season.create!(
    year: season_info['year'],
    display_name: season_info['displayName']
  )
  puts "\nCreated season #{season_info['displayName']}"

  season_info.dig('types', 'items').each do |type|
    url = type['$ref']
    type_info = fetch(url)
    next unless SubSeason::VALID_SUBTYPES.include?(type_info['name'])

    ssn.sub_seasons.create!(
      subtype: type_info['name'],
      year: type_info['year'],
      start_date: type_info['startDate'],
      end_date: type_info['endDate']
    )
    puts "Created #{season_info['displayName']} #{type_info['name']}"
  end
end

binding.pry
