class CreatePlaylists < ActiveRecord::Migration[5.0]
    
    def change
        create_table :playlists do |t|
            t.string :name
            t.string :mood
        end
    end

end
