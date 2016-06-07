class ItemsController < ApplicationController
	def new
	end

	def create
	end

	def index
		@items = Item.all
		render json: @items
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
