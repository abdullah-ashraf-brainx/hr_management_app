class Candidate < ApplicationRecord
  has_one_attached :cv
  belongs_to :hiring_position
end