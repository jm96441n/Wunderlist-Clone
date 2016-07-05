class Priorities < ActiveRecord::Migration
  def change
  	create_table :priorities do |t|
  		t.belongs_to :todo, null: false
  		t.string :level, default: "Low"
  	end
  end
end
