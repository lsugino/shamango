class CreateFriends < ActiveRecord::Migration
  def change
    create_table(:friends) do |t|
      t.belongs_to :member
      t.integer :id_of_friend
      t.timestamps
    end
  end
end
