class AddDescriptionToNovels < ActiveRecord::Migration[5.2]
  def change
    add_column :novels, :description, :text
  end
end
