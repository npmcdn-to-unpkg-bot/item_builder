class CreateRunesTable < ActiveRecord::Migration
  def change
    create_table :runes do |t|
    	t.integer :riot_id
    	t.string :name
    	t.text :description
    	t.text :sanitized_description
    	t.text :image
    	t.text :stats
    	t.string :type
    end
  end
end
