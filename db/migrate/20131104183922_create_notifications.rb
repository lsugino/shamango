class CreateNotifications < ActiveRecord::Migration
  def change
  	create_table :notifications do |t|
      t.belongs_to :member
      t.text :notification_message
      t.timestamps
    end
  end
end

