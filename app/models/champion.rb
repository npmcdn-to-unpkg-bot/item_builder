class Champion < ActiveRecord::Base
	store :image, accessors: [:full, :x, :y, :w, :h, :sprite]
	store :spell_1
	store :spell_2
	store :spell_3
	store :spell_4
	store :passive
end
