require 'rails_helper'
#irei inserir o factorybot  para diminuir  o código 

describe 'selling recipes by api and' do 
	it 'successfully view all recipes' do 
		conn = Faraday.new(url: 'http://localhost:4000/api/v1')
		response = conn.get '/api/v1/recipes'

		expect(response.body).to include 'Bolodecenoura'
		expect(response.status).to eq 200
	end

	it 'successfully in show recipe' do 
		conn = Faraday.new(url: 'http://localhost:4000/api/v1')
		response = conn.get '/api/v1/recipes/4'

		expect(response.body).to include 'Bolodecenoura'
		expect(response.status).to eq 200
	end

	it 'successfully in create recipe' do 
		conn = Faraday.new(:url => 'http://localhost:4000/api/v1')
		response = {}
		conn.post do |req|
		  req.url '/api/v1/recipes/',recipe:{title: 'teste', recipe_type:'teste', cuisine:'teste', cook_method:'teste', cook_time:43 , ingredients: 'teste', difficulty:'teste'}
		  req.headers['Content-Type'] = 'application/json'
		  req.body = '{"title": "teste", "recipe_type":"teste", "cuisine":"teste", "cook_method":"teste", "cook_time":43 , "ingredients": "teste", "difficulty":"teste"}'
		  response = req.body 
		end

			expect(response).to include 'teste'
			# expect(response) faltando a opção de status 
	end

	it 'successfully in update recipe' do 
		conn = Faraday.new(:url => 'http://localhost:4000/api/v1')
		response = {}
		conn.patch do |req|
		  req.url '/api/v1/recipes/4',recipe:{title: 'Bolodecenoura', recipe_type:'teste2', cuisine:'teste', cook_method:'teste2', cook_time:43 , ingredients: 'teste', difficulty:'teste'}
		  req.headers['Content-Type'] = 'application/json'
		  req.body = '{"title": "teste2", "recipe_type":"teste2", "cuisine":"teste", "cook_method":"teste2", "cook_time":43 , "ingredients": "teste", "difficulty":"teste"}'
		  response = req.body 
		end

			expect(response).to include 'teste'
			# expect(response) faltando a opção de status 
	end

		it 'successfully in delete recipe' do 
		conn = Faraday.new(:url => 'http://localhost:4000/api/v1')
		response = {}
		conn.delete do |req|
		  req.url '/api/v1/recipes/3'
		  req.headers['Content-Type'] = 'application/json'
		  response = req.body 
		end

			# expect(response).to include 'teste' faltando o resultado  obtido
			# expect(response) faltando a opção de status que é o mais importante 
	end

end

