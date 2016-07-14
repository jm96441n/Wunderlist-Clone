class AddCheckedColumnToReminders < ActiveRecord::Migration
  def change
  	add_column :reminders, :checked, :boolean, default: false
  end
end
