class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text    :name
      t.text    :notes
      t.text    :tags
      t.text    :format # book, article, coursera course 
      t.text    :visual
      
      # do i need both?
      t.integer :priority
      t.integer :order

      # for pie chart
      t.integer :progress
      t.integer :total
      t.date    :start  # set automatically based on progress/total
      t.date    :end    # set automatically based on progress/total
      t.text    :status # set automatically based on progress/total

      # dailies
      t.boolean :daily
      t.boolean :daily_completed
      t.integer :daily_priority
      t.integer :daily_order

      t.timestamps
    end
  end
end
