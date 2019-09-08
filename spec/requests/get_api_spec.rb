require 'rails_helper'

describe 'selling recipes by api and' do 
	it 'successfully view all recipes' do 
		response = Faraday.get 'http://localhost:4000/api/v1/recipes'

		json_recipe_api = JSON.parse(response.body, symbolize_names: true)

		expect(response.body).to include 'Bolo de abacaxi'
		expect(response.status).to eq 200
	end

	it 'successfully in show recipe' do 
		response = Faraday.get'http://localhost:4000/api/v1/recipes/4'

		json_recipe_api = JSON.parse(response.body, symbolize_names: true)

		expect(json_recipe_api[:title]).to include 'Bolo de abacaxi'
		expect(response.status).to eq 200
	end

	it 'successfully in create recipe' do 
		url = 'http://localhost:4000/api/v1/recipes'
		recipe = '{"title": "Bolo de banana", "difficulty": "Médio", "recipe_type": "brasileira", "cuisine": "brasileira", "cook_time": "50", "ingredients": "Farinha,açucar, cenoura", "cook_method": "Cozinhe a cenoura"}'
		response = Faraday.post(url, recipe,"Content-Type" => "application/json")

		json_recipe_api = JSON.parse(response.body, symbolize_names: true)

		expect(json_recipe_api[:title]).to include "Bolo de banana"
		expect(response.status).to eq 201
	end

	it 'successfully in update recipe' do 
		url = 'http://localhost:4000/api/v1/recipes/7'
		recipe = '{"title": "Bolo de abacaxi"}'
		response = Faraday.patch(url,recipe,"Content-Type" => "application/json")

		json_recipe_api = JSON.parse(response.body, symbolize_names: true)

		expect(json_recipe_api[:title]).to include 'Bolo de abacaxi'
		expect(response.status).to eq 202
	end

		it 'successfully in delete recipe' do 
			response = Faraday.delete 'http://localhost:4000/api/v1/recipes/12'

			expect(response.body).not_to include 'teste' 
			expect(response.status).to eq 202
	end

end


