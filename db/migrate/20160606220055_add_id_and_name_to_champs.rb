class AddIdAndNameToChamps < ActiveRecord::Migration
  def change
  	add_column :champions, :riot_id, :integer
  	add_column :champions, :name, :string
  	add_index :champions, :riot_id, :unique => true
  end
end