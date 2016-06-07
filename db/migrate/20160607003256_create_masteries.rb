class CreateMasteries < ActiveRecord::Migration
  def change
    create_table :masteries do |t|
    	t.integer :riot_id
    	t.string :name
    	t.text :description
    	t.text :sanitized_description
    	t.integer :ranks
    	t.string :prereq
    	t.text :image
    	t.string :mastery_tree
    end
  end
end
