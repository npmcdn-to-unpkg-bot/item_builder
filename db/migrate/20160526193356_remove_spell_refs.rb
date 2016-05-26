class RemoveSpellRefs < ActiveRecord::Migration
  def change
  	remove_column :champions, :spell_1
  	remove_column :champions, :spell_2
  	remove_column :champions, :spell_3
  	remove_column :champions, :spell_4
  	remove_column :champions, :image
  end
end
