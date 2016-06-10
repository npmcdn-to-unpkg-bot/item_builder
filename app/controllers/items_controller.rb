class ItemsController < ApplicationController

	def index
		@items = Item.all
		render json: @items
	end

	def get_real_stats
		raw_items = Item.all
		real_items = {}
		raw_items.each do |item|
			new_item = {}
			# First, let's gather the stats the are contained in the stats object
			# (yaknow, like they should be)
			unless item.stats.empty?
				item.stats.each do |stat, val|
					case stat
						when 'FlatArmorMod'
							new_item[:base_stats][:armor] = val
						when 'FlatCritChanceMod'
							new_item[:base_stats][:crit] = val
						when 'FlatHPPoolMod'
							new_item[:base_stats][:health] = val
						when 'FlatMPPoolMod'
							new_item[:base_stats][:mana] = val
						when 'FlatMagicDamageMod'
							new_item[:base_stats][:ability_power] = val
						when 'FlatMovementSpeedMod'
							new_item[:base_stats][:flat_move_speed] = val
						when 'FlatPhysicalDamageMod'
							new_item[:base_stats][:attack_damage] = val
						when 'FlatSpellBlockMod'
							new_item[:base_stats][:magic_resist] = val
						when 'PercentAttackSpeedMod'
							new_item[:base_stats][:attack_speed] = val
						when 'PercentLifeStealMod'
							new_item[:base_stats][:life_steal] = val
						# when 'PercentMovementSpeedMod'
						# 	new_item[:base_stats][:percent_move_speed] = val
					end
				end
				# Next it's time to grab the myriad stats exceptions
				# 1. Mana Regen
				# 2. HP Regen
				# 3. Magic Penetration
				# 4. Spell Penetration
				# 5. Cooldown Reduction
				# 6. Flat Mana
				# 	Manamune, Seraph's, Tear, RoA
				# 7. % HP Pool (Cinderhulk
				# 8. % AP (Rabadon/wooglet)
				# 9. % Spell pen / Armor Pen
				# 10. Aura buffs (MR, MR Reduction, HP Regen, etc)
				# 11. Unique Passives (Life Steal, Penetration, MoveSpeed(% and flat), GoldPer10)
				# 12. Special cases (Spirit Visage, Black Cleaver, Sterak's, Warmog's, Hex core, Mobi Boots, Death's Dance, Essence Reaver, Jaurum's Fist, Mejai)
				# 13: Tenacity
			end
		end
	end

	def populate
		# This function will be used to populate the champions table with the current values
		# from the Riot API.  Will only be called when new patches introduce changes
		riotApiBaseUrl = 'https://na.api.pvp.net/api/lol/';
        itemPath = 'static-data/na/v1.2/item';
        ddragonVersion = '6.9.1';
        apiKey = '0457fb60-d595-4a50-b8ba-4c3af101fb20'
        response = RestClient.get riotApiBaseUrl + itemPath, {:params => {:api_key => apiKey, :itemListData => 'all'}}
		@all_items = JSON.parse(response)['data']
		#Iterate through each champion and save to the database using the
		# Champion model
		@all_items.each do |key, item|
			new_item = Hash.new
			new_item[:riot_id] = item['id']
			new_item[:name] = item['name']
			new_item[:group] = item['group']
			new_item[:description] = item['description']
			new_item[:sanitized_description] = item['sanitizedDescription']
			new_item[:plain_text] = item['plainText']
			new_item[:depth] = item['depth']
			new_item[:from] = item['from']
			new_item[:hide_from_all] = item['hideFromAll']
			new_item[:maps] = item['maps'].to_h
			new_item[:image] = item['image'].to_h
			new_item[:stats] = item['stats'].to_h
			new_item[:gold] = item['gold'].to_h
			new_item[:effect] = item['effect'].to_h
			new_item[:consumed] = item['consumed']
			new_item[:colloq] = item['colloq']
			new_item[:tags] = item['tags'].to_a
			new_item[:into] = item['into']
			new_item[:stacks] = item['stacks']
			new_item[:in_store] = item['inStore']
			new_item[:required_champion] = item['requiredChampion']
			new_item[:special_recipe] = item['specialRecipe']
			saveme = Item.create(new_item)
			saveme.save
		end
	end
end
