class CreateMatomes < ActiveRecord::Migration[5.2]
  def change
    create_table :matomes do |t|
      t.string :title
      t.text :discription
      t.integer :like

      t.timestamps
    end
  end
end
