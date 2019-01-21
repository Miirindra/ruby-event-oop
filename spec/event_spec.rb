require_relative '../lib/event'

describe Event do

  before(:each) do
    Object.send(:remove_const, 'Event')
    load 'event.rb'
  end

	describe 'initialize' do
		it 'creates an event' do

		end
	end

end