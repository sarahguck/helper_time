class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text    :content
      t.text    :tags
      t.integer :entry_id

      t.timestamps
    end
  
    add_index :posts, :entry_id
  end
end
