class MainController < ApplicationController
  def index
  	@champions = Champion.select("riot_id, name, description, image").all \
  	.order(name: :asc)
  	@raw_items = Item.all #select("riot_id, name, sanitized_description, image, stats, gold, effect, colloq, required_champion, maps, 'group', 'from', 'into'")
  	@runes = Rune.all
  	@masteries = Mastery.all
  	@items = []
  	nonsense_items = [3675,3672,3673,3671]
  	@raw_items.each do |item|
  		if(not(item['consumed']) && not(item['group'] == "DoransItems" || item['group'] == "FlaskGroup" || item['group'] == "RelicBase") && 	not(nonsense_items.include?(item['riot_id'])))
  			@items.append(item)
  		end
  	end
  end
end
