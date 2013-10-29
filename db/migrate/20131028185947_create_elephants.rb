class CreateElephants < ActiveRecord::Migration
  def change
    create_table(:elephants) do |t|
      t.string :name
    end
  end
end
