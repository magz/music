require "spec_helper"
require './library.rb'

RSpec.describe Library do
  let(:library) { Library.new }

  describe '#adds_track' do
    it 'adds a track to its storage' do
      library.add_track('Ghostface Killah', 'One')
      expect(library.tracks).to eq([['Ghostface Killah', 'One']])
    end
  end

end
