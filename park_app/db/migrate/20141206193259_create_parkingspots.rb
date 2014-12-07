class CreateParkingspots < ActiveRecord::Migration
  def change
    create_table :parkingspots do |t|
    	t.string :boroughcode
    	t.references :statusordernumber
    	t.integer :signsequence
    	t.integer :distance
    	t.string :arrowpoints
    	t.string :signdescription

      t.timestamps
    end
  end
end
