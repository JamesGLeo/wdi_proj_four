class CreateRegulations < ActiveRecord::Migration
  def change
    create_table :regulations do |t|
      t.string :sign
      t.string :borough
      t.string :regulation_number
      t.string :description
      t.string :direction
      t.integer :distance_regulated

      t.timestamps
    end
  end
end
