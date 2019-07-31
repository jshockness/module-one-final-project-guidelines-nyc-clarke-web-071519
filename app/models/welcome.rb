require 'tty-font'
require 'tty-prompt'
require 'colorize'

font = TTY::Font.new(:doom)
prompt = TTY::Prompt.new

puts font.write("Welcome to the MMM:").colorize(:red)
puts font.write("Mood Music Maker").colorize(:white)





  # here when a user enters their name, if it is already in the database it will pull the name up and put "Welcome back, user.name"
  
 
  # create and display a menu with 4 options that the user is prompted to select from after entering their name
  # they can choose from 0-4
  
 
