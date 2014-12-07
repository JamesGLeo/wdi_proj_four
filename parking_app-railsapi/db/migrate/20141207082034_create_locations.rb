class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :sign
      t.string :borough
      t.string :mainstreet
      t.string :startstreet
      t.string :endstreet
      t.string :streetside

      t.timestamps
    end
  end
end
