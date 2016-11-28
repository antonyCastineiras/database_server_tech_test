require './app/database_server.rb'

describe DatabaseServer do
	context 'visiting the set route' do
		it 'writes to the data.csv file' do
			file = File.open('./app/data.csv','w+').truncate(0)
			visit('/set?name=antony')
			expect(File.open('./app/data.csv','r').readlines.size).to eq 1
		end
	end
end