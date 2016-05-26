class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :full
      t.string :group
      t.integer :h
      t.string :sprite
      t.integer :w
      t.integer :x
      t.integer :y
      t.integer :z

      t.timestamps null: false
    end
  end
end
