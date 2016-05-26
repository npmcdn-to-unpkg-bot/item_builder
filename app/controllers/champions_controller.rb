class ChampionsController < ApplicationController

	def new
	end

	def create
	end

	def index
		@champions = Champion.all
	end

	def show
	end

	def edit
	end

	def update
	end

	def populate
		# This function will be used to populate the champions table with the current values
		# from the Riot API.  Will only be called when new patches introduce changes
		riotApiBaseUrl = 'https://na.api.pvp.net/api/lol/';
        championPath = 'static-data/na/v1.2/champion';
        ddragonVersion = '6.9.1';
        apiKey = '0457fb60-d595-4a50-b8ba-4c3af101fb20'
        response = RestClient.get riotApiBaseUrl + championPath, {:params => {:api_key => apiKey, :champData => 'all'}}
		all_champions = JSON.parse(response)['data']
		@champ_yaml = all_champions.to_yaml
		#Iterate through each champion and save to the database using the
		# Champion model
		@champions = []
		all_champions.each do |key, champion|
			new_champion = Hash.new
			new_champion[:image] = champion['image'].to_json
			new_champion[:base_armor] = champion['stats']['armor']
			new_champion[:armor_per_lvl] = champion['stats']['armorperlevel']
			new_champion[:base_ad] = champion['stats']['attackdamage']
			new_champion[:ad_per_lvl] = champion['stats']['attackdamageperlevel']
			new_champion[:base_range] = champion['stats']['attackrange']
			new_champion[:base_as] = champion['stats']['attackspeedoffset']
			new_champion[:as_per_lvl] = champion['stats']['attackspeedperlevel']
			new_champion[:base_crit] = champion['stats']['crit']
			new_champion[:crit_per_lvl] = champion['stats']['critperlevel']
			new_champion[:base_hp] = champion['stats']['hp']
			new_champion[:hp_per_lvl] = champion['stats']['hp_per_lvl']
			new_champion[:base_hp5] = champion['stats']['hpregen']
			new_champion[:hp5_per_lvl] = champion['stats']['hpregenperlevel']
			new_champion[:base_ms] = champion['stats']['movespeed']
			new_champion[:base_mana] = champion['stats']['mp']
			new_champion[:base_mp5] = champion['stats']['mpregen']
			new_champion[:mp5_per_lvl] = champion['stats']['mpregenperlevel']
			new_champion[:base_mr] = champion['stats']['spellblock']
			new_champion[:mr_per_lvl] = champion['stats']['spellblockperlevel']
			
			@champions.push(new_champion)
		end
	end

end
