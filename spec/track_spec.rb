require "spec_helper"
require './track.rb'

RSpec.describe Track do
  let(:track) { Track.new('Ghostface Killah', 'One') }

  describe '#played?' do
    it 'returns false if unplayed' do
      expect(track.played?).to eq(false)
    end

    it 'returns true if played once' do
      track.play
      expect(track.played?).to eq(true)
    end

    it 'returns true if played more than once' do
      track.play
      track.play
      expect(track.played?).to eq(true)
    end
  end

  describe '#display_name' do
    it 'returns the properly formatted display name' do
      expect(track.display_name).to eq("\"One\" by Ghostface Killah")
    end
  end
end