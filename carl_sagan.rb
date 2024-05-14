# name : Harsimran
# date :2024-05-14
# Assingment :challenge 01
# Description: It is the code regarding geeting values form arrays and making our own data .Using Api and open
# data to feth and show data

# Using a single puts statement build the following sentence using only data from the carl hash and the
# sagan array along with some string interpolation.
#
# We are a way for the cosmos to know itself.

carl  = {
          :toast => 'cosmos',
          :punctuation => [ ',', '.', '?' ],
          :words => [ 'know', 'for', 'we']
        }

sagan = [
          { :are => 'are', 'A' => 'a' },
          { 'waaaaaay' => 'way', :th3 => 'the' },
          'itself',
          { 2 => ['to']}
        ]

# Here is an example of building a setence out of array/hash pieces.
example = [ 'test', 'a', 'is']
time    = { :that => 'This', :period => '.'}
puts "#{time[:that]} #{example[2]} #{example[1]} #{example[0]}#{time[:period]}"

##put statement to write the sentance given in assignment
puts "#{carl[:words][2].capitalize} #{sagan[0][:are]} #{sagan[0]['A']} #{sagan[1]['waaaaaay']} #{carl[:words][1]} #{sagan[1][:th3]} #{carl[:toast]} #{sagan[3][2][0]} #{carl[:words][0]} #{sagan[2]}#{carl[:punctuation][1]} "


# question 2 Creating a has called ghosts
ghosts = [
  { name: 'Inky', age: 4, loves: 'reindeers', net_worth: '25 dollars' },
  { name: 'Pinky', age: 5, loves: 'garden tools', net_worth: '14 dollars' },
  { name: 'Blinky', age: 7, loves: 'ninjas', net_worth: '18.03 dollars' },
  { name: 'Clyde', age: 6, loves: 'yarn', net_worth: '0 dollars' }
]

#testing snippet to see if result ==expertations

ghosts.each do |ghost|
  ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
  ghost_info += "loves #{ghost[:loves]} and "
  ghost_info += "has #{ghost[:net_worth]} dollars in the bank."
  puts ghost_info
end

#Question 3 using JSON and fetching dog.ceo API

require 'net/http'
require 'json'
require 'pp'
url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.

# loops to print the dog and sub breed as shown in assignment overview
dog_breeds['message'].each do |breed, sub_breeds|
  puts "* #{breed}"
  sub_breeds.each do |sub_breed|
    puts "  * #{sub_breed}"
  end
end

# Question-4 Using city open data to see how many ash tress are their in the city.

require 'net/http'
require 'json'

# Define the URL for the full tree dataset
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
trees = JSON.parse(response)
ash_tree_count = 0

trees.each do |tree|
  if tree['common_name'].to_s.downcase.include?('ash')
    ash_tree_count += 1
  end
end

# Output the number of ash trees found
puts "Number of Ash trees in the dataset: #{ash_tree_count}"
