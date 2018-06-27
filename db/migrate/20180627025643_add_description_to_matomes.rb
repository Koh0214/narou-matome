class AddDescriptionToMatomes < ActiveRecord::Migration[5.2]
  def change
    add_column :matomes, :description, :text
  end
end
