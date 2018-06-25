class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.string :title
      t.text :discription
      t.text :review
      t.text :url
      t.text :amazon_url
      t.references :matome, foreign_key: true

      t.timestamps
    end
  end
end
