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
    describe 'full' do
      it 'returns the properly formatted string for unplayed tracks' do
        message = track.display_name(:full)
        expect(message).to eq("\"One\" by Ghostface Killah (unplayed)")
      end
      it 'returns the properly formatted string for played tracks' do
        track.play
        message = track.display_name(:full)
        expect(message).to eq("\"One\" by Ghostface Killah (played)")
      end
    end
    describe 'title_and_artist' do
      it 'returns the properly formatted string' do
        message = track.display_name(:title_and_artist)
        expect(message).to eq("\"One\" by Ghostface Killah")
      end
    end
    describe 'title' do
      it 'returns the properly formatted string' do
        message = track.display_name(:title)
        expect(message).to eq("\"One\"")
      end
    end
  end
end
