class Candidate < ApplicationRecord
  has_one_attached :candidate_cv
  belongs_to :hiring_position
end
