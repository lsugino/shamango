class CreateFriendships < ActiveRecord::Migration
  def change
  	create_table :friendships do |t|
  		t.integer :members_id_one
  		t.integer :members_id_two
  		t.boolean :accepted, default: false
  		t.timestamps
  	end
  end
end
