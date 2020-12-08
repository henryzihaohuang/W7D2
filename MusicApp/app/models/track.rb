class Track < ApplicationRecord

    validates :version, inclusion: {in: %w(regular bonus)}


    belongs_to :album,
        foreign_key: :album_id,
        class_name: :Album


    
end