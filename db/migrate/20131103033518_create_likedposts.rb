class CreateLikedposts < ActiveRecord::Migration
  def change
  	create_table :likedposts do |t|
      t.belongs_to :member
      t.integer :post_id
      t.timestamps
    end
  end
end
