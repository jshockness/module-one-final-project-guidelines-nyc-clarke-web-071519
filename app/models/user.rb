class User < ActiveRecord::Base
    has_many :favorites
    has_many :playlists, through: :favorites
end 

def add_favorite(playlist)
    f = Favorite.create(playlist_id: playlist.id, user_id: self.id)
    # $username.favorites << f
  end

  def delete_favorite(playlist)
    fave_id = Favorite.where(playlist_id: playlist.id, user_id: self.id).first.id
    Favorite.destroy(fave_id)
    # $username.favorites.destroy(playlist.id)
  end

# quick git test