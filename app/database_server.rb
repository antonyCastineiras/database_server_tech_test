require 'sinatra/base'
require 'yaml'
require 'csv'

class DatabaseServer < Sinatra::Base

	enable :sessions

	get '/set' do
		session[:stored_params] = params.to_yaml
		write_params_to_csv(params)
		"#{params} stored in memory"
	end

	get '/get' do
		stored_params = YAML.load(session[:stored_params])
		"#{stored_params.values[0]} is the current value"
	end

	def write_params_to_csv(hash)
		CSV.open('./app/data.csv', "wb") { |csv| hash.to_a.each { |item| csv << item } }
	end
end