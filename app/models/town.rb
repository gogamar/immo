class Town < ApplicationRecord
  has_one_attached :photo
  has_many :realestates
end
