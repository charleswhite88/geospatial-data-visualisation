# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.string :sequence_number
      t.string :request_type
      t.string :request_action
      t.datetime :response_due_datetime
      t.string :primary_service_area_code
      t.string :additional_service_area_codes
      t.string :digsite_well_known_text

      t.timestamps
    end

    add_index :tickets, :request_number, unique: true
    add_index :tickets, :primary_service_area_code
    add_index :tickets, :response_due_datetime
  end
end
