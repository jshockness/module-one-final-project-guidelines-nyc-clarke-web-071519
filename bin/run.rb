require_relative '../config/environment'
require 'tty-font'
require 'tty-prompt'
require 'pry'

# find playlist by mood, then ask the user if they would like to save playlist

def playlist_search
  mood = get_mood_from_user
  # method that gets the mood input from a user
  playlist_array = create_playlist_array(mood)
  # method of creating a playlist array that is created with the mood when user enters the mood
  limit = get_playlist_limit(playlist_array, mood)
  # if there are only 4 "sad" moods in the db and the user enter 6, it returns 
  selected_playlists = view_playlists(playlist_array)
  # it displays the selected playlists and gives the user the number of playlists that are associated with that mood
  mms = mood_menu
  # defining the mood menu
  mood_menu_selection(mms, selected_playlists)
  # method that when the mood was selected it shows the selected playlists
  main_menu
end

def get_mood_from_user
   puts "Please enter a mood:"
   mood = gets.chomp
end

def create_playlist_array(mood)
  array1 = []
  Playlist.all.select do |playlist|
    playlist.mood.split.find do |mood_input|
      if mood_input.strip == mood 
        array1 << playlist
      end
    end
  end
  return array1.uniq
end

# here we are creating an array that takes in the users input of mood and is selecting the array of moods that 
# are associated with the playlists

def get_playlist_limit(playlist_array, mood)
 
  # if the user enters a mood that is not associated with a playlist, the user is prompted to re-enter a mood
  if playlist_array.empty?
    puts "Sorry, there are no playlists with #{mood}!"
    puts "Let's try again..."
    
    playlist_search
  end
  # when the user does enter a mood that is associated with the playlist, it allows the user
  # to choose how many they would like to see
  puts "Here are #{playlist_array.length} playlists that include #{mood}."    
  puts "Press ENTER to view the playlists:"
  
  choice = gets.chomp.to_i

  # here if the user enters they want to view 5 playlists for the mood "sad" but there are only 3
  # it tells them that there are only 3 playlists and displays the correct number of playlists
  if choice > playlist_array.length
  
    puts "Oops! There are only #{playlist_array.length} playlists!"
    choice = playlist_array.length
  else
    choice
  end
end

def view_playlists(playlist_array)
  
  # if the user enters they want to see 2 out of the 2 "sad" playlists, it displays "here you go"
  # it goes through each playlist by the index and displays them in order on seperate lines
  puts "Here you go!"
  playlist_array.each_with_index do |playlist, i|
   sleep(1.5)
    puts "#{i+1}. #{playlist.name}"
    
    sleep(1.5)
  end
end
sleep(3.0)

def mood_menu
 
  puts "Please choose one:"
  puts "1. Return to main menu"
  puts "2. Save a playlist to favorites"
  
  choice = gets.chomp
end

def mood_menu_selection(choice, selected_playlists=nil)
  case choice
  when "1"
    # return to main menu
    false
  when "2", "save"
    # save a playlist to favorites
    save_to_favorites(selected_playlists)
    true
  else
    puts "Invalid choice!"
    true
  end
end

# here we are iterating thrpugh the fav to make sure that the fav is in the user's favorited playlists

def save_to_favorites(selected_playlists)
  isrunning = true
  while isrunning
    puts "Which playlist would you like to save? Type the number  or (q to quit):"
    choice = gets.chomp
    if choice.start_with?("q")
      break
    end
    playlist = selected_playlists[choice.to_i]

      puts "Save #{playlist.name}? (y/n)"
      choice = gets.chomp
      case choice
      when "y", "yes"
        User.add_favorite(playlist)
        puts "#{playlist.name} added to your favorites!"
      when "n", "no"
        puts "Returning to main menu..."
        isrunning = false
      else
        puts "Invalid input!"
      end
    end
  end



#_________________________________________________


# view favorites method
  def most_popular_playlists
    results = Favorite.all.group(:playlist_id).count
    results = results.sort_by {|x , y|}.uniq
    puts "There are #{results.count} playlists favorited."
    print "How many playlists would you like to see?"
    user_input = gets.chomp.to_i
  
    # here we are seeing which users have favorited the same playlists
    # we are grouping them together
    # we are iterating through the playlist_id and then sorting the results 
    # and asking the user how many of the most favorited websites they would like to see
  
    if user_input > results.count
      sleep(2.0)
        puts "Oops...sorry! You only have #{results.count} playlists favorited!"
        sleep(3.0)
        puts "Here are the top #{results.count} playlists!" 
        sleep(3.0)
        user_input = results.count
    end
  
    # if the user inputs a number that is greater than the result of how many favorites there are
    # it prints a sorry message and lets the user enter a number again
  
  
  show_favorites(results, user_input)
    sleep(5)
    puts "Screen will clear in 5 seconds!!"
    sleep(5)
    system "clear"
    main_menu
    end
  
    # here we are showing the favorites and then the screen will close out 
    # and go back to the home screen in 5 seconds
  
  
  def show_favorites(results, user_input)
    puts "The top #{user_input} playlists are:"
    results [0...user_input].each_with_index do |result, i|
        playlist = Playlist.find(result[0])
        puts "#{i+1}. #{playlist.name}"
        sleep(1.0)
    end
  end


# _________________________________________________________
  

  
 
  # here we are showing the top favorites playlist that has been favorited by users
  # we are taking the user input and putting the result in an indexed
  # order list so that the viewer can see the list in a neat way
  #____________________________________________________________

  # show songs from a playlist





  #________________________________________________________________
  def main_menu
    puts "MAIN MENU"
  
    puts "1. find a playlist by mood"
    puts "2. view your favorite playlists"
    puts "3. view most popular playlist among users"
    puts "4. view  songs from a playlist"
    puts "5. exit"
    choice = gets.chomp
    menu_selection(choice)
  end

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
      show_playlist_songs
      # show a user's playlist songs
    when "5", "exit"
      exit
exit!
abort("EXIT!!")
    end
    menu_selection
  end
  

  #_________________________________________________
  
  def run
      print "Please enter your first name: "
      name = gets.chomp
  
      puts "Hello, #{name}, please type in a number 1-5 "
  
      puts "MAIN MENU"
  
      puts "1. find a playlist by mood"
      puts "2. view your favorite playlists"
      puts "3. view most popular playlist among users"
      puts "4. view songs from a playlist"
      puts "5. exit"
  
      choice = gets.chomp

      
      
      menu_selection(choice)

      main_menu
      
     
    end
  
   run
  