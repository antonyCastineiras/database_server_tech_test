require 'sinatra/base'

class DatabaseServer < Sinatra::Base

	get '/' do
		'Hello world'
	end

end