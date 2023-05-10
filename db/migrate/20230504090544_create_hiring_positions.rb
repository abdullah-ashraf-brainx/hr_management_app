class CreateHiringPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :hiring_positions do |t|
      t.text :title
      t.text :job_details
      t.text :location

      t.timestamps
    end
  end
end
