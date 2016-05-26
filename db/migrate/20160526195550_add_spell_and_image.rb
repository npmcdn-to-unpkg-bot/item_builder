class AddSpellAndImage < ActiveRecord::Migration
  def change
  	add_column :champions, :spell_1, :text
  	add_column :champions, :spell_2, :text
  	add_column :champions, :spell_3, :text
  	add_column :champions, :spell_4, :text
  	add_column :champions, :image, :text
  end
end
