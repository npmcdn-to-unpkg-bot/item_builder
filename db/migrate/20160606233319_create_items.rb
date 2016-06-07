class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.integer :riot_id, index:true, unique:true
    	t.string :name
    	t.string :group
    	t.text :description
    	t.text :sanitized_description
    	t.string :plain_text
    	t.integer :depth
    	t.text :from
    	t.boolean :hide_from_all
    	t.text :maps
    	t.text :image
    	t.text :stats
    	t.text :gold
    	t.text :effect
    	t.boolean :consumed
    	t.string :colloq
    	t.text :tags
    	t.text :into
    	t.integer :stacks
    	t.boolean :in_store
    	t.string :required_champion
    	t.integer :special_recipe
    end
  end
end
