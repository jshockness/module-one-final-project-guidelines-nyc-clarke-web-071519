
 

User.destroy_all
Song.destroy_all
Playlist.destroy_all
SongPlaylist.destroy_all
Favorite.destroy_all



10.times do 
    User.create(name: Faker::Name.first_name)
end


# -------------------- Fresh START -------------------------------------
# ------------------------------Drake Playlist
drake_songs = [Song.create(name: "Nonstop", artist: "Drake"),
    Song.create(name: "Elevate", artist: "Drake"),
    Song.create(name: "Emotionless", artist: "Drake"),
    Song.create(name: "God's Plan", artist: "Drake"),
    Song.create(name: "Mob Ties", artist: "Drake"),
    Song.create(name: "In My Feelings", artist: "Drake")]
    
drake_playlist = Playlist.create(name:"Just Drake It", mood:"Drake")
    
drake_songs.each do |song| 
    SongPlaylist.create(playlist_id: drake_playlist.id, song_id: song.id)
end
    
#------------------------------- Dance Playlist
dance_songs = [Song.create(name: "Summertime Magic", artist: "Childish Gambino"),
    Song.create(name: "Juice", artist: "Lizzo"),
    Song.create(name: "Hold Up", artist: "Beyonce"),
    Song.create(name: "Slide", artist: "Calvin Harris"),
    Song.create(name: "Mi Gente", artist: "J Balvin"),
    Song.create(name: "That's What I Like", artist: "Bruno Mars"),
    Song.create(name: "Can't Feel My Face", artist: "The Weeknd"),
    Song.create(name: "All The Stars (feat. SZA)", artist: "Kendrick Lamar"),
    Song.create(name: "Can't Stop The Feeling", artist: "Justin Timberlake"),
    Song.create(name: "Make Me Feel", artist: "Janelle Monáe"),
    Song.create(name: "Sugar", artist: "Maroon 5"),
    Song.create(name: "Closer", artist: "The Chainsmokers"),
    Song.create(name: "Your Love", artist: "David Guetta"),
    Song.create(name: "Pon de Replay", artist: "Rihanna"),
    Song.create(name: "Temperature", artist: "Sean Paul"),
    Song.create(name: "Right Thurr", artist: "Chingy"),
    Song.create(name: "Crank That", artist: "Soulja Boy"),
    Song.create(name: "Viva La Vida", artist: "Coldplay"),
    Song.create(name: "Welcome to the Party", artist: "Pop Smoke")]
    # Song.create(name: "In My Feelings", artist: "Drake")

dance_playlist = Playlist.create(name: "Dance Mode: On", mood: "Dance")

dance_songs.each do |song|
    SongPlaylist.create(song_id: song.id, playlist_id: dance_playlist.id)
end
add_drake = Song.find_by(name: 'In My Feelings')
SongPlaylist.create(song_id: add_drake.id, playlist_id: dance_playlist.id)

#--------------------------------Happy Playlist
happy_songs = [Song.create(name: "Happy", artist: "Pharrell Williams"),
    Song.create(name: "Walking On Sunshine", artist: "Katrina & The Waves"),
    Song.create(name: "Glad You Came", artist: "VIZE"),
    Song.create(name: "A Thousand Miles", artist: "Vanessa Carlton"),
    Song.create(name: "A Sky Full of Stars", artist: "Coldplay"),
    Song.create(name: "Beach House", artist: "The Chainsmokers"),
    Song.create(name: "Rude", artist: "MAGIC!"),
    Song.create(name: "Summer Love (feat. Rita Ora)", artist: "Rudimental"),
    Song.create(name: "I'm Like a Bird", artist: "Nelly Furtado"),
    Song.create(name: "Can You Feel It", artist: "Birgir"),
    Song.create(name: "Viva La Vida", artist: "Coldplay"),
    Song.create(name: "Next Mistake", artist: "Icona Pop"),
    Song.create(name: "You Come First (feat. Saweetie)", artist: "Zak Abel"),
    Song.create(name: "Look What You Made Me Do", artist: "Taylor Swift"),
    Song.create(name: "High and Low", artist: "Empire of the Sun"),
    Song.create(name: "Electric (feat. Khalid)", artist: "Alina Baraz"),
    Song.create(name: "Flirt Right Back", artist: "blackbear"),
    Song.create(name: "All Night (feat. Knox Fortune)", artist: "Chance the Rapper"),
    Song.create(name: "iSpy (feat. Lil Yachty)", artist: "KYLE"),
    Song.create(name: "Brooklyn In The Summer", artist: "Aloe Blacc"),
    Song.create(name: "I Like Me Better", artist: "Lauv"),
    Song.create(name: "Best Day Of My Life", artist: "American Authors"),
    Song.create(name: "A Good Night (feat. BloodPop)", artist: "John Legend"),
    Song.create(name: "What's Going On", artist: "Marvin Gaye"),
    Song.create(name: "You Need To Calm Down", artist: "Taylor Swift"),
    Song.create(name: "MOOD 4 EVA", artist: "Beyoncé"),
    Song.create(name: "Sunflower (feat. Swae Lee)", artist: "Post Malone"),
    Song.create(name: "If I Can't Have You", artist: "Shawn Mendes"),
    Song.create(name: "BROWN SKIN GIRL", artist: "Beyoncé"),
    Song.create(name: "Old Town Road (feat. Billy Ray Cyrus)", artist: "Lil Nas X"),
    Song.create(name: "Happpier (feat. Bastille)", artist: "Marshmello")]

happy_playlist = Playlist.create(name: "😀 😃 😄 😁 Playlist", mood: "Happy")

happy_songs.each do |song|
    SongPlaylist.create(song_id: song.id, playlist_id: happy_playlist.id)
end


#----------------------------------------- Sad Playlist
sad_songs = [Song.create(name: "the lonely", artist: "Christina Perri"),
    Song.create(name: "Grieving", artist: "Liz Bissonette"),
    Song.create(name: "Sorry", artist: "Aquilo"),
    Song.create(name: "Can't Help Falling in Love", artist: "Haley Reinhart"),
    Song.create(name: "Call Out My Name", artist: "The Weeknd"),
    Song.create(name: "Skyscrapper", artist: "Demi Lovato"),
    Song.create(name: "One More Light", artist: "Linkin Park"),
    Song.create(name: "Drowning Shadows", artist: "Sam Smith"),
    Song.create(name: "Tonight I'm Getting Over You", artist: "Carly Rae Jepsen"),
    Song.create(name: "We Find Love", artist: "Daniel Caesar"),
    Song.create(name: "One Last Time", artist: "Ariana Grande"),
    Song.create(name: "Tears In The Rain", artist: "The Weeknd"),
    Song.create(name: "Cry Me a River", artist: "Justin Timberlake"),
    Song.create(name: "Nothing Fails", artist: "Madonna"),
    Song.create(name: "The Crying Game (feat. Jessie Ware)", artist: "Nicki Minaj"),
    Song.create(name: "Perfect", artist: "Selena Gomez"),
    Song.create(name: "4 In The Morning", artist: "Gwen Stefani"),
    Song.create(name: "Man On The Moon", artist: "Britney Spears"),
    Song.create(name: "I Hate This Part", artist: "The Pussycat Dolls"),
    Song.create(name: "Heart Crush", artist: "BJ The Chicago Kid"),
    Song.create(name: "The Scientist", artist: "Coldplay"),
    Song.create(name: "Too Good at Goodbyes", artist: "Sam Smith"),
    Song.create(name: "Someone Like You", artist: "Adele"),
    Song.create(name: "Happier", artist: "Ed Sheeran"),
    Song.create(name: "Stay With Me", artist: "Sam Smith"),
    Song.create(name: "Stay (feat. Mikky Ekko)", artist: "Rihanna"),
    Song.create(name: "i love you", artist: "Billie Eilish"),
    Song.create(name: "Slow Dancing in a Burning Room", artist: "John Mayer"),
    Song.create(name: "Make You Feel My Love", artist: "Adele"),
    Song.create(name: "The A Team", artist: "Ed Sheeran"),
    Song.create(name: "When I Was Your Man", artist: " Bruno Mars"),
    Song.create(name: "I Guess I Just Feel Like", artist: "John Mayer"),
    Song.create(name: "Turning Tables", artist: "Adele"),
    Song.create(name: "It Will Rain", artist: "Bruno Mars"),
    Song.create(name: "If I Ain't Got You", artist: "Alicia Keys")]

sad_playlist = Playlist.create(name: "Someone's Got the Blues: Who Brokeup with You?", mood: "Sad")

sad_songs.each do |song|
    SongPlaylist.create(song_id: song.id, playlist_id: sad_playlist.id)
end


#---------------------------------- Workout Playlist
workout_songs = [Song.create(name: "KIKA (feat.Tory Lanez)", artist: "6ix9ine"),
    Song.create(name: "Have Mercy", artist: "YBN Cordae"),
    Song.create(name: "Wish Wish (feat. Cardi B & 21 Savage)", artist: "DJ Khaled"),
    Song.create(name: "Keanu Reeves", artist: "Logic"),
    Song.create(name: "Seasons (feat. Vado)", artist: "Mesa"),
    Song.create(name: "DJ Turn It Up", artist: "Yellow Claw"),
    Song.create(name: "Pure Water (feat. Migos)", artist: "Mustard"),
    Song.create(name: "Grinding All My Life", artist: "Nipsey Hussle"),
    Song.create(name: "Go Loko (feat. Tyga & Jon Z", artist: "YG"),
    Song.create(name: "Bricks (feat. Migos)", artist: "Carnage"),
    Song.create(name: "Tap (feat. Meek Mill)", artist: "NAV"),
    Song.create(name: "We Ball", artist: "Ace Hood"),
    Song.create(name: "Project Dreams (feat. Roddy Rich)", artist: "Carnage"),
    Song.create(name: "Undefeated (feat. Lil Keed)", artist: "Future"),
    Song.create(name: "Jesus Walks", artist: "Kanye West"),
    Song.create(name: "No Smoke", artist: "YoungBoy Never Broke Again"),
    Song.create(name: "Panicking", artist: "Lil Haiti"),
    Song.create(name: "Wasit Time", artist: "Diplo"),
    Song.create(name: "Haute (feat. J Balvin & Chris Brown)", artist: "Tyga"),
    Song.create(name: "MEGATRON", artist: "Nicki Minaj"),
    Song.create(name: "Dedication (feat. Kendrick Lamar)", artist: "Nipsey Hussle"),
    Song.create(name: "Eye of the Tiger", artist: "Survivor")]

workout_playlist = Playlist.create(name: "Game of Tone", mood: "Workout")

workout_songs.each do |song|
    SongPlaylist.create(song_id: song.id, playlist_id: workout_playlist.id)
end


#--------------------------------- Chill Playlist
chill_songs = [Song.create(name: "Why (Remix)[feat. Leon Bridges]", artist: "Shawn Mendes"),
    Song.create(name: "Coffee", artist: "Joel Adams"),
    Song.create(name: "Hey Ma", artist: "Cam'ron"),
    Song.create(name: "Ms. Jackson", artist: "OutKast"),
    Song.create(name: "All Falls Down", artist: "Kanye West"),
    Song.create(name: "Truth Hurts", artist: "Lizzo"),
    Song.create(name: "Talk", artist: "Khalid"),
    Song.create(name: "Roses", artist: "OutKast"),
    Song.create(name: "Gold Digger (feat. Jamie Foxx)", artist: "Kanye West"),
    Song.create(name: "Viva La Vida", artist: "Coldplay"),
    Song.create(name: "Bartender (feat. Akon)", artist: "T-Pain"),
    Song.create(name: "I'm N Luv(Wit a Stripper)[feat. Mike Jones]", artist: "T-Pain"),
    Song.create(name: "The Way You Move", artist: "OutKast"),
    Song.create(name: "Good as Hell", artist: "Lizzo"),
    Song.create(name: "21 Questions", artist: "50 Cent"),
    Song.create(name: "Drop It Like It's Hot (feat. Pharrell Williams)", artist: "Snoop Dogg"),
    Song.create(name: "Location", artist: "Khalid"),
    Song.create(name: "Just a Friend", artist: "Mario"),
    Song.create(name: "A Milli", artist: "Lil Wayne"),
    Song.create(name: "It Wasn't Me", artist: "Shaggy"),
    Song.create(name: "Run It! (feat. Juelz Santana)", artist: "Chris Brown"),
    Song.create(name: "I'm Sprung", artist: "T-Pain"),
    Song.create(name: "Let Me Love You", artist: "Mario"),
    Song.create(name: "One Two Step (feat. Missy Elliott)", artist: "Ciara"),
    Song.create(name: "It's Goin' Down (feat. Nitti)", artist: "Yung Joc"),
    Song.create(name: "Fergalicious (feat. will.i.am)", artist: "Fergie"),
    Song.create(name: "Buy U a Drank (feat. Yung Joc)", artist: "T-Pain"),
    Song.create(name: "Shawty Is Da Shit (feat. Fabolous)", artist: "The-Dream"),
    Song.create(name: "Tell Me When To Go (feat. Keak Da Sneak)", artist: "E-40")]


chill_playlist = Playlist.create(name: "Music & Chill?", mood: "Chill")

chill_songs.each do |song|
    SongPlaylist.create(song_id: song.id, playlist_id: chill_playlist.id)
end  


#----------------------------------------- Throwback Playlist
throwback_songs = [Song.create(name: "I Say a Little Prayer", artist: "Aretha Franklin"),
    Song.create(name: "Hypnotize", artist: "The Notorious B.I.G."),
    Song.create(name: "Move On Up", artist: "Curtis Mayfield"),
    Song.create(name: "Country Grammar", artist: "Nelly"),
    Song.create(name: "No Scrubs", artist: "TLC"),
    Song.create(name: "California Love (feat. Dr. Dre & Roger)", artist: "2 Pac"),
    Song.create(name: "Wouldn't It Be Nice", artist: "The Beach Boys"),
    Song.create(name: "Laffy Taffy", artist: "D4L"),
    Song.create(name: "Super Freak", artist: "Rick James"),
    Song.create(name: "You Sexy Thing", artist: "Hot Chocolate"),
    Song.create(name: "Sir Duke", artist: "Stevie Wonder"),
    Song.create(name: "Say My Name", artist: "Destiny's Child"),
    Song.create(name: "Back In My Arms Again", artist: "The Supremes"),
    Song.create(name: "Sunshine (feat. Lea)", artist: "Lil' Flip"),
    Song.create(name: "You (feat. Lil Wayne)", artist: "Lloyd"),
    Song.create(name: "Mesmerize (feat. Ashanti)", artist: "Ja Rule"),
    Song.create(name: "Peaches and Cream", artist: "112"),
    Song.create(name: "Tipsy", artist: "J-Kwon"),
    Song.create(name: "Put It On Me", artist: "Ja Rule"),
    Song.create(name: "Freek-A-Leek", artist: "Petey Pablo"),
    Song.create(name: "Lean Wit It, Rock Wit It", artist: "Dem Franchize Boys"),
    Song.create(name: "Right Thurr", artist: "Chingy"),
    Song.create(name: "Always Om Time (feat. Ashanti)", artist: "Ja Rule"),
    Song.create(name: "Jumpin', Jumpin'", artist: "Destiny's Child"),
    Song.create(name: "Too Close", artist: "Next"),
    Song.create(name: "Foolish", artist: "Ashanti"),
    Song.create(name: "Poison", artist: "Bell Biv DeVoe"),
    Song.create(name: "Salt Shaker", artist: "Ying Yang Twins"),
    Song.create(name: "My Girl", artist: "The Temptations"),
    Song.create(name: "No Diggity", artist: "Blackstreet"),
    Song.create(name: "Feels so Good", artist: "Mase"),
    Song.create(name: "Where My Girls At", artist: "702"),
    Song.create(name: "I Wanna Be Down", artist: "Brandy")]

throwback_playlist = Playlist.create(name: "Take Me Back...Wayyy Back", mood: "Throwback")

throwback_songs.each do |song|
    SongPlaylist.create(song_id: song.id, playlist_id: throwback_playlist.id)
end


 Favorite.create(user_id: User.first.id, playlist_id: drake_playlist.id)
 Favorite.create(user_id: User.first.id, playlist_id: sad_playlist.id)

 