class RunesController < ApplicationController
	def new
	end

	def create
	end

	def index
		@runes = Rune.all
		render json: @runes
	end

	def show
	end

	def edit
	end

	def update
	end

	def populate
		# This function will be used to populate the runes table with the current values
		# from the Riot API.  Will only be called when new patches introduce changes
		riotApiBaseUrl = 'https://na.api.pvp.net/api/lol/';
        runePath = 'static-data/na/v1.2/rune';
        ddragonVersion = '6.9.1';
        apiKey = '0457fb60-d595-4a50-b8ba-4c3af101fb20'
        response = RestClient.get riotApiBaseUrl + runePath, {:params => {:api_key => apiKey, :runeListData => 'all'}}
		@all_runes = JSON.parse(response)['data']
		#Iterate through each rune and save to the database using the
		# rune model
		@all_runes.each do |key, rune|
			if(rune['rune']['tier'] == "3")
				new_rune = Hash.new
				new_rune[:riot_id] = rune['id']
				new_rune[:name] = rune['name']
				new_rune[:description] = rune['description']
				new_rune[:sanitized_description] = rune['sanitized_description']
				new_rune[:image] = rune['image'].to_h
				new_rune[:stats] = rune['stats'].to_h
				new_rune[:rune_type] = rune['rune']['type']
				Rune.create(new_rune)
			end
		end
	end
end
