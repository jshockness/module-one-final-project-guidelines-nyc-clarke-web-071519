class User < ActiveRecord::Base
    has_many :favorites
    has_many :playlists, through: :favorites
end 


# quick git test