class Mastery < ActiveRecord::Base
	serialize :description
	serialize :sanitized_description
	store :image, accessors: [:full, :x, :y, :w, :h, :sprite]
end