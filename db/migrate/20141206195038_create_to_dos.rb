class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.text    :name
      t.text    :notes
      t.text    :tags
      t.integer :entry_id

      t.boolean :today
      t.boolean :completed

      t.integer :priority
      t.integer :order

      t.timestamps
    end

    add_index :to_dos, :entry_id
  end
end