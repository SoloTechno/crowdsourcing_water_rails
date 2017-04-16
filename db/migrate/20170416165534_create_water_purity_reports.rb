class CreateWaterPurityReports < ActiveRecord::Migration[5.0]
  def change
    create_table :water_purity_reports do |t|
      t.integer :user_id
      t.string :reporter_name
      t.string :location
      t.decimal :lat, precision: 25, scale: 20
      t.decimal :lng, precision: 25, scale: 20
      t.integer :water_condition
      t.decimal :virus_ppm
      t.decimal :contaminant_ppm

      t.timestamps
    end
  end
end
