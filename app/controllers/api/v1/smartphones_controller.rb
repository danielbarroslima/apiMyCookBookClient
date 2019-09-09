class Api::V1::SmartphonesController < Api::V1::ApiController

	def index
		recipes = JSON.parse((Faraday.get 'http://localhost:4000/api/v1/recipes').body, symbolize_names: true)
		render json: recipes , status: :ok
	end

	def show
		recipe = JSON.parse((Faraday.get'http://localhost:4000/api/v1/recipes/4').body, symbolize_names: true)
		render json:recipe, status: :ok
	end

	def create
		url = 'http://localhost:4000/api/v1/recipes'
		recipe = '{"title": "Bolo de banana", "difficulty": "Médio", "recipe_type": "brasileira", "cuisine": "brasileira", "cook_time": "50", "ingredients": "Farinha,açucar, cenoura", "cook_method": "Cozinhe a cenoura"}'
		recipe = JSON.parse((Faraday.post(url,recipe,"Content-Type" => "application/json")).body, symbolize_names: true)	
		render json: recipe, status: 201
	end

	def update
		url = 'http://localhost:4000/api/v1/recipes/14'
		recipe = '{"title": "Bolo de abacaxi"}'
		recipe = JSON.parse((Faraday.patch(url,recipe,"Content-Type" => "application/json")).body symbolize_names: true)
		reder json: recipe, status: :accepted
		
	end

	def destroy
		recipe = JSON.parse((Faraday.delete 'http://localhost:4000/api/v1/recipes/13').body, symbolize_names: true)
		render json: recipe, status: :accepted
	end

	private
		def params_recipe
			params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients,  :cook_method)
			
		end
end



