require_relative '../config/environment'
require 'tty-font'
require 'tty-prompt'

# find playlist by mood

def playlist_search
  mood = get_mood_from_user
  playlist_array = create_playlist_array(mood)
  limit = get_playlist_limit(playlist_array, mood)
  selected_playlists = view_playlists(playlist_array, limit)
  mms = mood_menu
  mood_menu_selection(mms, selected_playlists)
  main_menu
end

def get_mood_from_user
  
  puts "Please enter a mood:"
  mood = gets.chomp
end

def create_playlist_array(mood)
  arr = []
  Playlist.all.select do |playlist|
    playlist.mood.split(",").find do |mo|
      if mo.strip == mood ||
        mo.strip == (mood + " ") ||
        mo.strip == (" " + mood)
        arr << playlist
      end
    end
  end
  return arr.uniq
end

def get_playlist_limit(playlist_array, mood)
  puts
  if playlist_array.empty?
    puts "Sorry, there are no playlists with #{mood}!"
    puts "Let's try again..."
    playlist_search
  end
  puts "There are #{playlist_array.length} playlists that include #{mood}. How many would you like to view?"
  
  choice = gets.chomp.to_i

  if choice > playlist_array.length
  
    puts "Oops! There are only #{playlist_array.length} playlists!"
    choice = playlist_array.length
  else
    choice
  end
end

def view_playlists(playlist_array, limit)
  
  puts "Here you go!"
  playlist_array[0...limit.to_i].each_with_index do |playlist, i|
   
    puts "#{i+1}. #{playlist.name}"
    puts "#{playlist.mood}"
    sleep(0.5)
  end
end

def mood_menu
 
  puts "Please choose one:"
  puts "1. Return to main menu"
  puts "2. Save a playlist to favorites"
  puts "3. Delete a playlist"
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

def in_user_favorites?(playlists)
  # checks user's favorites to make sure it hasn't been added yet
  User.favorite.each do |fav|
    if fav.playlist_id == playlist.id
      return true
    end
  end
  false
end

def save_to_favorites(selected_playlists)
  isrunning = true
  while isrunning
    puts "Which playlist would you like to save? Type the number (q to quit):"
    choice = gets.chomp
    if choice.start_with?("q")
      break
    end
    playlist = selected_playlists[choice.to_i - 1]

    if in_user_favorites?(playlist)
      puts "You've already added this playlist to your favorites!"
      next
    else
      puts "Save #{playlist.name}? (y/n)"
      choice = gets.chomp
      case choice
      when "y", "yes"
        User.add_favorite(playlist)
        puts
        puts "#{playlist.name} added to your favorites!"
      when "n", "no"
        puts "Returning to main menu..."
        isrunning = false
      else
        puts "Invalid input!"
      end
    end
  end

end

#_________________________________________________
# view favorites
def view_user_favorites
  faves = $username.favorites.reload

  if faves.empty?
    
    puts "You don't have any favorites saved yet!"
    puts "Returning to main menu..."
    main_menu
  else
    
    puts "Here are your favorite playlists:"
    i = 1
    faves.each do |fave|
      puts "#{i}. #{fave.playlist.name}"
      i += 1
      sleep(0.5)
    end
    
    puts "Returning to main menu..."
    main_menu
  end

end

  # _________________________________________________________
  
  
  def most_popular_playlists
    results = Favorite.all.group(:playlist_id).count
    results = results.sort_by {|x , y| y}.reverse
    puts "There are #{results.count} playlists favorited."
    print "How many playlists would you like to see?"
    user_input = gets.chomp.to_i
  
    # here we are seeing which users have favorited the same playlists
    # we are grouping them together
    # we are iterating through the playlist_id and then sorting the results 
    # and asking the user how many of the most favorited websites they would like to see
  
    if user_input > results.count
        puts "Oops...sorry! We only have #{results.count} playlists favorited!"
        user_input = results.count
    end
  
    # if the user inputs a number that is greater than the result of how many favorites there are
    # it prints a sorry message and lets the user enter a number again
  
  
  show_favorites(results, user_input)
    sleep(5)
    puts "Screen will clear in 8 seconds!!"
    sleep(8)
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
  
  # here we are showing the top favorites playlist that has been favorited by users
  #____________________________________________________________

  # delete a playlisy from favorites
  def get_playlist_to_delete
    favorites = User.favorites
    fav_to_delete = display_faves(favorites)
    User.delete_favorite(fav_to_delete)
    main_menu
  end

  #g get the user to delete their playlist
  
  def display_faves(favorites)
    puts "Here are all your favorites:"
    favorites.each_with_index do |fave, i|
      playlist = Playlist.find(fave.playlist_id)
      puts "#{i+1}. #{playlist.name}"
    end

    # here I want to display the user's favorited playlists
    # before they can delete it
    
    print "Which playlist would you like to remove from favorites? "
    play_num = gets.chomp.to_i
    playlist = Playlist.find(favorites[play_num-1].playlist_id)
    print "Confirm deletion of #{playlist.name}? (y/n) "
    yn = gets.chomp
    if yn.start_with?("y")
      playlist
    end
  end
  # here I want to ask them what playlist would you like to remove?
  # when they enter the name, i am then comfirming if they are sure
  # that they would like to delete it
  
  
  def run
      print "Please enter your first name: "
      name = gets.chomp
  
      puts "Hello, #{name}, please type in a number 1-5 "
  
      puts "MAIN MENU"
  
      puts "1. find a playlist by mood"
      puts "2. view your favorite playlists"
      puts "3. view most popular playlist among users"
      puts "4. delete a playlist from your favorites"
      puts "5. exit"
  
      choice = gets.chomp
      menu_selection(choice)
     
    end
  
   run
  