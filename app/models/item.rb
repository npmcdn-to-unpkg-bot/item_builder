class Item < ActiveRecord::Base
	store :image, accessors: [:full, :x, :y, :w, :h, :sprite]
	store :maps
	store :stats
	store :gold
	store :effect
	# Future development: Implement into and from as a self-referential HABTM relationship
	# on the items table
	serialize :into
	serialize :from
	serialize :tags
end
