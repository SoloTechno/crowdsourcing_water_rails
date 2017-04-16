class CreateWaterSourceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :water_source_reports do |t|
      t.string :reporter_name
      t.string :location
      t.decimal :lat
      t.decimal :lng
      t.integer :water_condition
      t.integer :water_type

      t.timestamps
    end
  end
end
