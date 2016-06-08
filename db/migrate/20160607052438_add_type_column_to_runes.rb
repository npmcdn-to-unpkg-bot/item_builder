class AddTypeColumnToRunes < ActiveRecord::Migration
  def change
  	add_column :runes, :rune_type, :string
  end
end
