class HiringPosition < ApplicationRecord
    has_one_attached :poster_image
    has_many :candidates, dependent: :destroy
end
