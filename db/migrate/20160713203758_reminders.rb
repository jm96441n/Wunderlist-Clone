class Reminders < ActiveRecord::Migration
  def change
  	create_table :reminders do |t|
  		t.datetime :time, null: false
  		t.belongs_to :todo, null: false, index: true
  	end
  end
end
