# user1 = User.new("Jason")
# user2 = User.new("Alyssa")

User.destroy_all
Song.destroy_all
Playlist.destroy_all
SongPlaylist.destroy_all
Favorite.destroy_all



10.times do 
    User.create(name: Faker::Name.first_name)
end

Song.create(name: "Welcome to the Party",artist: "Pop Smoke")
Song.create(name: "Nonstop", artist: "Drake")
Song.create(name: "Elevate", artist: "Drake")
Song.create(name: "Emotionless", artist: "Drake")
Song.create(name: "God's Plan", artist: "Drake")
Song.create(name: "Mob Ties", artist: "Drake")
Song.create(name: "In My Feelings", artist: "Drake")

drake_list = Playlist.create(name: "Drake",mood: "Drake")
not_drake_list = Playlist.create(name: "Not-Drake",mood: "Not-Drake")
happy_list = Playlist.create(name: "Happy Vibes", mood: "Happy")
happy2_list = Playlist.create(name: "Don't Worry, Be Happy" , mood: "Happy")
sad_list = Playlist.create(name: "Someone's Got the Blues", mood: "Sad")
sad2_list = Playlist.create(name: "Sadness Tunes", mood: "Sad")
workout_list = Playlist.create(name: "Workout Vibes",  mood: "Workout")

just_drake  = Song.all.select do|song|
    song.artist == "Drake"
end

just_drake.each do |song|
    SongPlaylist.create(song_id: song.id, playlist_id: drake_list.id)
end

Favorite.create(user_id: User.all.sample.id, playlist_id: drake_list.id)
Favorite.create(user_id: User.all.sample.id, playlist_id: happy2_list.id)
Favorite.create(user_id: User.all.sample.id, playlist_id: happy_list.id)

