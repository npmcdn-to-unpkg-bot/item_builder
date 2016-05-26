class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.float :base_hp
      t.float :base_hp5
      t.float :base_mana
      t.float :base_mp5
      t.float :base_range
      t.float :base_ad
      t.float :base_as
      t.float :base_armor
      t.float :base_mr
      t.float :base_ms
      t.float :hp_per_lvl
      t.float :hp5_per_lvl
      t.float :mana_per_lvl
      t.float :mp5_per_lvl
      t.float :range_per_lvl
      t.float :ad_per_lvl
      t.float :as_per_lvl
      t.float :armor_per_lvl
      t.float :mr_per_lvl
      t.float :ms_per_lvl
      t.text :description
      t.text :passive
      t.references :spell_1, index: true, foreign_key: true
      t.references :spell_2, index: true, foreign_key: true
      t.references :spell_3, index: true, foreign_key: true
      t.references :spell_4, index: true, foreign_key: true
      t.float :base_crit
      t.float :crit_per_lvl
      t.references :image, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
