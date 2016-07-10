class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
  		t.belongs_to :todo, null: false
  		t.string :level, default: "Low"
      t.timestamps null: false
    end
  end
end
