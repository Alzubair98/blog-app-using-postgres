class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamps
    end
    add_reference :comments, :users, null: false, foreign_key: true
    add_reference :comments, :posts, null: false, foreign_key: true
  end
end
