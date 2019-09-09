require 'rails_helper'

describe 'selling recipes by api and' do 
	it 'successfully' do 
		get '/api/v1/smartphones'

		expect(response.body).to include('Bolo de abacaxi')
		expect(response.status).to eq 200
	end

	it 'successfully in show recipe' do 
		get '/api/v1/smartphones/4'

		expect(response.body).to include 'Bolo de abacaxi'
		expect(response.status).to eq 200
	end

	it 'successfully in delete recipe' do 
			delete '/api/v1/smartphones/13'

			expect(response.body).not_to include 'teste' 
			expect(response.status).to eq 202
	end

	it 'successfully in update recipe' do 
		patch '/api/v1/smartphones/14'

		expect(json_recipe_api[:title]).to include 'Bolo de abacaxi'
		expect(response.status).to eq 202
	end


end


