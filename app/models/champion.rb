class Champion < ActiveRecord::Base
  belongs_to :spell_1
  belongs_to :spell_2
  belongs_to :spell_3
  belongs_to :spell_4
  belongs_to :image
end
