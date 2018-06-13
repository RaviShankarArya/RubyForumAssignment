class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.boolean :is_archived, default: false
      t.references :forum, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
