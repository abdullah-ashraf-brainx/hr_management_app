class HiringPosition < ApplicationRecord
    has_one_attached :image
    has_many :candidates, dependent: :destroy
end
