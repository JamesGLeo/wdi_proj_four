class CreateParkingspots < ActiveRecord::Migration
  def change
    create_table :parkingspots do |t|
      t.string :boroughcode
      t.string :statusordernumber
      t.integer :signsequence
      t.integer :distance
      t.string :arrowpoints
      t.string :signdescription
      t.string :SUNDAY, array: true, default: []
      t.string :MONDAY, array: true, default: []
      t.string :TUESDAY, array: true, default: []
      t.string :WEDNESDAY, array: true, default: []
      t.string :THURSDAY, array: true, default: []
      t.string :FRIDAY, array: true, default: []
      t.string :SATURDAY, array: true, default: []
      t.timestamps
    end
  end
end
