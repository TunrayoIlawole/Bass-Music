class Album < ApplicationRecord
  has_many :tracks
  has_many :favourites
  has_many :favourited_by, through: :favourites, source: :user
end
