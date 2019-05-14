require "spec_helper"
require './library.rb'

RSpec.describe Library do
  let(:library) do
    l = Library.new
    l.add_track('Ghostface Killah', 'One')
    l
  end

  describe '#adds_track' do
    it 'adds a track to its storage' do
      l = Library.new
      l.add_track('Ghostface Killah', 'One')

      expect(l.tracks.count).to eq(1)
      expect(l.tracks.first.artist).to eq('Ghostface Killah')
      expect(l.tracks.first.title).to eq('One')
    end

    describe '#play_track' do
      it 'returns track on valid title and marks it as played' do
        track = library.play_track('One')
        expect(track.title).to eq('One')
        expect(track.played?).to eq(true)
      end
    end

    describe '#find_track_by_title' do
      it 'returns track on valid title' do
        track = library.find_track_by_title('One')
        expect(track.title).to eq('One')
      end

      it 'returns nil on invalid title' do
        track = library.find_track_by_title('Nonsense')
        expect(track).to eq(nil)
      end
    end

    describe '#find_tracks_by_artist' do
      it 'returns tracks on valid artist' do
        library.add_track('Ghostface Killah', 'Nutmeg')
        library.add_track('Wu Tang Clan', 'Da Art of Chessboxin')

        tracks = library.find_tracks_by_artist('Ghostface Killah')
        expect(tracks.count).to eq(2)
        expect(tracks.map(&:artist).uniq).to contain_exactly('Ghostface Killah')
        expect(tracks.map(&:title)).to contain_exactly('One', 'Nutmeg')
      end
    end

    describe '#unplayed' do
      it 'returns unplayed tracks form storage by default' do
        library.add_track('Ghostface Killah', 'Nutmeg')
        library.add_track('Wu Tang Clan', 'Da Art of Chessboxin')

        library.play_track('Nutmeg')
        unplayed_tracks = library.unplayed

        expect(unplayed_tracks.count).to eq(2)
        expect(unplayed_tracks.map(&:title)).to contain_exactly('One', 'Da Art of Chessboxin')
      end

      it 'returns unplayed from argument set of tracks' do
        played_track = Track.new('Ghostface Killah', 'One').play
        unplayed_track = Track.new('Ghostface Killah', 'Nutmeg')
        unplayed_tracks = library.unplayed([played_track, unplayed_track])
        expect(unplayed_tracks.count).to eq(1)
        expect(unplayed_tracks.map(&:title)).to contain_exactly('Nutmeg')
      end
    end

    describe '#unplayed_tracks_by_artist' do
      it 'returns only unplayed tracks by artist' do
        library.add_track('Ghostface Killah', 'Nutmeg')
        library.add_track('Wu Tang Clan', 'Da Art of Chessboxin')
        library.play_track('Nutmeg')

        unplayed_tracks = library.unplayed_tracks_by_artist('Ghostface Killah')

        expect(unplayed_tracks.count).to eq(1)
        expect(unplayed_tracks.map(&:title)).to contain_exactly('One')
      end
    end
  end
end
