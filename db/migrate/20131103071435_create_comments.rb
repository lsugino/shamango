class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
      t.belongs_to :post
      t.belongs_to :member
      t.text :contents
      t.timestamps
    end
  end
end

