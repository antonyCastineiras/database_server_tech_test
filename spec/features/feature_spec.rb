require 'spec_helper'

feature 'storing params in memory' do
	scenario 'storing the params via /set?key=value' do
		visit('/set?name=antony')
		expect(page).to have_content('{"name"=>"antony"} stored in memory')
	end

	scenario 'returning stored params via /get' do
		visit('/set?name=antony')
		visit('/get')
		expect(page).to have_content('antony is the current value')
	end
end