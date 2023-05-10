require 'csv'

class Candidate < ApplicationRecord
  has_one_attached :cv
  belongs_to :hiring_position

  def self.to_csv
    attributes = %w{name email phone university experience}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |candidate|
        csv << attributes.map {|attr| candidate.send(attr)}
      end
    end
  end

end
