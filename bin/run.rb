require_relative '../config/environment'
require 'tty-font'
require 'tty-prompt'
require 'pry'


@current_user = nil

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
  sm =second_menu
  # defining the mood menu
  second_menu_selection(sm, selected_playlists)
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

def second_menu
 
  puts "Please choose one:"
  puts "1. Return to main menu"
  puts "2. Save playlist to favorites"
  
  choice = gets.chomp
end

def second_menu_selection(choice, selected_playlists=nil)
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


def in_user_favorites?(playlist)
  # checks user's favorites to make sure it hasn't been added yet
  @current_user.favorites.each do |fav|
    if fav.playlist_id == playlist.id
      return true
    end
  end
  false
end

def add_favorite(playlist)
  f = []
  f = Favorite.create(playlist_id: playlist.id, user_id: user.id)
  @current_user.favorites << f
end

def save_to_favorites(selected_playlists)

  puts "Which playlist would you like to save? Type the number from above or 'q' to quit:"
    user_input = gets.chomp
    if user_input.start_with?("q")
      main_menu
    else
    playlist = selected_playlists[user_input.to_i - 1]
  end

    if in_user_favorites?(playlist)
      puts "You've already added this playlist to your favorites!"
      puts "Returning you back to the Main Menu in 3...2...1:"
      sleep(3)
    else
      puts "Save #{playlist.name}? (y/n)"
      user_input = gets.chomp

      case user_input
      when "y", "yes"
       @current_user.add_favorite(playlist)
        
        puts "#{playlist.name} added to your favorites!"
      when "n", "no"
        puts "Returning to main menu..."
       main_menu
     
        puts "Invalid input!"
      end
    end
  end



    

    
  



#_________________________________________________


# view favorites method

def view_user_favorites
  binding.pry 
  user_favorite_playlist = @current_user.playlists.all
  binding.pry 
  puts "Here are your favorites playlists!"
  user_favorite_playlist.each do |playlist|
    Favorite.playlist(name)
  end

end
  
  
def view_user_favorites
  faves = @current_user.favorites

  if faves.empty?
    
    puts "You don't have any favorites saved yet!"
    puts "Returning to main menu..."
    main_menu
  else
    
    puts "Here are your favorite playlists:"
   
    faves.each do |fave|
      puts "#{fave.playlist.name}"
      sleep(0.5)
    end
    sleep(4)
    puts "Returning to main menu..."
    sleep(3)
    main_menu
  end

end

  #____________________________________________________________

  # show songs from a playlist
  def show_playlist_songs
  

  end

#________________________________________________________________
  #delete playlist from user's favorite

def get_playlist_to_delete
  favorites = @current_user.favorites
  fav_to_delete = display_faves(favorites)
  @current_user.delete_favorite(fav_to_delete)
  main_menu
  end
  
  
 
  def display_faves(favorites)
    puts "Here are all your favorites:"
    favorites.each_with_index do |fave, i|
      playlist = Playlist.find(fave.playlist_id)
      puts "#{i+1}. #{playlist.name}"
    end

    # display favorites in a numerated list according to the index that 
    # belongs to each favorite
    sleep(3)
    
    print "Which playlist would you like to remove from favorites? "
    user_input = gets.chomp.to_i
    playlist = Playlist.find(favorites[user_input-1].playlist_id)
    print "Confirm deletion of #{playlist.name}? (y/n) "
    user_input = gets.chomp

    if user_input.start_with?("y")
      playlist
    end

  if user_input.start_with?("n")
    puts "You chose not to delete #{playlist.name}...returning you back to the Main Menu"
    sleep(3)
    main_menu
  end
end
  
  #________________________________________________________________

  def main_menu
    puts "MAIN MENU"
  
    puts "1. Find a playlist by mood"
    puts "2. View your favorite playlists"
    puts "3. View a playlist's songs"
    puts "4. Delete a playlist from favorites"
    puts "5. Exit"
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
      show_playlist_songs
      # show a user's playlist songs
    when "4"
      
    get_playlist_to_delete
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
      user_input = gets.chomp
      @current_user = User.find_or_create_by(name: user_input)

   
      puts "Hello, #{@current_user.name}, please type in a number 1-4"
  
      puts "MAIN MENU"
  
      puts "1. Find a playlist by mood"
      puts "2. View a user's favorite playlists"
      puts "3. View songs from a playlist"
      puts "4. Delete playlist from favorite"
      puts "5. Exit"
  
      choice = gets.chomp

      
      
      menu_selection(choice)

      
      main_menu
      
     
    end

   run
  