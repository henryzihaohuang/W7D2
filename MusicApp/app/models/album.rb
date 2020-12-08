class Album < ApplicationRecord

    validates :title, :year, presence:true

    validates :version, inclusion: {in: %w(studio live)}

    belongs_to :band,
        foreign_key:band:id,
        class_name: :Band

    has_many :tracks,
        foreign_key: :album_id,
        class_name: :Track

end