# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  # validates :request_number, presence: true, uniqueness: true

  # Other validations and associations can be added here

  def digsite_coordinates
    # Parse and extract coordinates from the well-known text format
    coordinates = digsite_well_known_text.scan(/(-?\d+\.\d+)\s(-?\d+\.\d+)/)
    coordinates.map { |coord| [coord[1].to_f, coord[0].to_f] }
  end
end
