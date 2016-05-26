class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.text :cooldown
      t.float :cooldown_burn
      t.text :cost
      t.string :cost_burn
      t.string :cost_type
      t.text :description
      t.text :effect
      t.text :effect_burn
      t.references :image, index: true, foreign_key: true
      t.string :key
      t.integer :max_rank
      t.string :name
      t.text :range
      t.text :range_burn
      t.string :resource
      t.text :sanitized_description
      t.text :sanitized_tooltip
      t.text :var

      t.timestamps null: false
    end
  end
end
