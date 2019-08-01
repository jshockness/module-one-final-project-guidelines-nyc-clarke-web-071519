class User < ActiveRecord::Base
    has_many :favorites
    has_many :playlists, through: :favorites

    # class methods go inside of the class

    def add_favorite(playlist)
       Favorite.create(playlist_id: playlist.id, user_id: self.id)
    end

    def delete_favorite(playlist)
     Favorite.where(playlist_id: playlist.id, user_id: self.id)
    end
end 

# def add_favorite(playlist)
#     f = Favorite.create(playlist_id: playlist.id, user_id: self.id)
    
#   end

#   def delete_favorite(playlist)
#     fave_id = Favorite.where(playlist_id: recipe.id, user_id: self.id).first.id
#     Favorite.destroy(fave_id)
#   end


# # quick git test