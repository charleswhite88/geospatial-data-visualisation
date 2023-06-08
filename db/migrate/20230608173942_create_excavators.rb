# frozen_string_literal: true

class CreateExcavators < ActiveRecord::Migration[7.0]
  def change
    create_table :excavators do |t|
      t.references :ticket, null: false, foreign_key: true
      t.string :company_name
      t.string :address
      t.string :crew_on_site

      t.timestamps
    end

    add_index :excavators, :company_name
    add_index :excavators, :crew_on_site
  end
end
