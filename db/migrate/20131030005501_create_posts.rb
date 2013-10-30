class CreatePosts < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.belongs_to :member
      t.text :contents
      t.timestamps
<<<<<<< HEAD
  
=======
    end
>>>>>>> master
  end
end
