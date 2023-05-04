class HiringPosition < ApplicationRecord
    has_one_attached :hiring_image
    has_many :candidates, dependent: :destroy
end
