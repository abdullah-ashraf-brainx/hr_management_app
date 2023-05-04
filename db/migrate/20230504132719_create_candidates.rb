class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :university
      t.integer :experience
      t.references :hiring_position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
