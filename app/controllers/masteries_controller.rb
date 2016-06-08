class MasteriesController < ApplicationController
	def new
	end

	def create
	end

	def index
		@masteries = Mastery.all
		render json: @masteries
	end

	def show
	end

	def edit
	end

	def update
	end

	def populate
		# This function will be used to populate the masteries table with the current values
		# from the Riot API.  Will only be called when new patches introduce changes
		riotApiBaseUrl = 'https://na.api.pvp.net/api/lol/';
        masteryPath = 'static-data/na/v1.2/mastery';
        ddragonVersion = '6.9.1';
        apiKey = '0457fb60-d595-4a50-b8ba-4c3af101fb20'
        response = RestClient.get riotApiBaseUrl + masteryPath, {:params => {:api_key => apiKey, :masteryListData => 'all'}}
		@all_masteries = JSON.parse(response)['data']
		#Iterate through each mastery and save to the database using the
		# mastery model
		@all_masteries.each do |key, mastery|
			new_m = Hash.new
			new_m[:riot_id] = mastery['id']
			new_m[:name] = mastery['name']
			new_m[:description] = mastery['description'].to_a
			new_m[:sanitized_description] = mastery['sanitizedDescription'].to_a
			new_m[:ranks] = mastery['ranks']
			new_m[:prereq] = mastery['prereq']
			new_m[:image] = mastery['image'].to_h
			new_m[:mastery_tree] = mastery['masteryTree']
			Mastery.create(new_m)
		end
	end
end
