class Rune < ActiveRecord::Base
	store :image, accessors: [:full, :x, :y, :w, :h, :sprite]
	store :stats
end