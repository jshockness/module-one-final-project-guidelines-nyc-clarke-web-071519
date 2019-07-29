class Playlist < ActiveRecord::Base
    has_many :song_playlists
    has_many :songs, through: :song_playlists
end
