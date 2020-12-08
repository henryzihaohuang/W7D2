class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null:false
      t.string :title, null:false
      t.integer :ord, null:false
      t.string :lyrics
      t.string :version, limit:1, null:false
    end

    add_index :tracks, :album_id
  end
end
