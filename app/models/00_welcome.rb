require 'tty-font'
require 'tty-prompt'
require 'colorize'

font = TTY::Font.new(:doom)
prompt = TTY::Prompt.new

puts font.write("Welcome to the MMM:").colorize(:red)
puts font.write("Mood Music Maker").colorize(:white)





  # here when a user enters their name, if it is already in the database it will pull the name up and put "Welcome back, user.name"
  
  def main_menu
    puts "MAIN MENU"
  
    puts "1. find a playlist by mood"
    puts "2. view your favorite playlists"
    puts "3. view most popular playlist among users"
    puts "4. delete a playlist from your favorites"
    puts "5. exit"
    choice = gets.chomp
    menu_selection(choice)
  end

  # create and display a menu with 4 options that the user is prompted to select from after entering their name
  # they can choose from 0-4
  
  def menu_selection(choice)
    case choice
    when "1"
      # search for a playlist by mood
     playlist_search
    when "2"
      # view user's favorite playlist
      view_user_favorites
    when "3"
      #view_most_popular_playlist
      most_popular_playlists
    when "4"
      delete_favorite(playlist_search)
      # delete a user's favorite playlist
    when "5", "exit"
      exit
exit!
abort("EXIT!!")
    end
    menu_selection
  end
  
