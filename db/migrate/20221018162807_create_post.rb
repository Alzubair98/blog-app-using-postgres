class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text 
      t.integer :comments_counter 
      t.integer :likes_counter
      t.timestamps
    end
    add_reference :posts, :users, null: false, foreign_key: true
  end
end
