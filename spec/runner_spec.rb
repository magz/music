require "spec_helper"
require './runner.rb'

RSpec.describe Runner do
  let(:runner) do
    r = Runner.new
    r.library.add_track('Ghostface Killah', 'One')
    r.library.add_track('Ghostface Killah', 'Nutmeg')
    r.library.find_track_by_title('Nutmeg').play
    r.library.add_track('Wu Tang Clan', 'Da Art of Chessboxin')
    r
  end

  describe '#parse_input' do
    describe 'add' do
      it 'adds track on correct input and displays message' do
        r = Runner.new
        message = r.parse_input("add \"One\" \"Ghostface Killah\"")
        track = r.library.find_track_by_title('One')
        expect(message).to eq("Added #{track.display_name(:title_and_artist)}")
      end

      it 'returns error message if track already exists' do
        message = runner.parse_input("add \"One\" \"MF DOOM\"")
        expect(message).to eq("Track with title \"One\ already exists")
      end
    end

    describe 'play' do
      it 'plays track on correct input and displays message' do
        message = runner.parse_input("play \"One\"")
        expect(message).to eq("You're listening to \"One\"")
      end

      it 'returns error message on invalid input' do
        message = runner.parse_input("play \"Nonsense\"")
        expect(message).to eq("Track \"Nonsense\" not found")
      end
    end

    describe 'show all' do
      it 'returns a list of titles with played/unplayed information' do
        message = runner.parse_input('show all')
        expect(message.count).to eq(3)
        tracks = runner.library.tracks
        expect(message).to include(tracks[0].display_name(:full))
        expect(message).to include(tracks[1].display_name(:full))
        expect(message).to include(tracks[2].display_name(:full))
      end
    end

    describe 'show all by artist' do
      it 'returns a list of titles with played/unplayed information' do
        message = runner.parse_input("show all by \"Ghostface Killah\"")
        expect(message.count).to eq(2)
        tracks = runner.library.tracks
        expect(message).to include(tracks[0].display_name(:full))
        expect(message).to include(tracks[1].display_name(:full))
      end
    end

    describe 'show unplayed' do
      it 'returns a list of titles with played/unplayed information' do
        message = runner.parse_input('show unplayed')
        expect(message.count).to eq(2)
        tracks = runner.library.tracks
        expect(message).to include(tracks[0].display_name(:title_and_artist))
        expect(message).to include(tracks[2].display_name(:title_and_artist))
      end
    end

    describe 'show unplayed by artist' do
      it 'returns a list of titles with played/unplayed information' do
        message = runner.parse_input("show unplayed by \"Ghostface Killah\"")
        expect(message.count).to eq(1)
        tracks = runner.library.tracks
        expect(message).to include(tracks[0].display_name(:title_and_artist))
      end
    end

    describe 'invalid input' do
      it 'returns error message' do
        message = runner.parse_input('nonsense')
        expect(message).to eq('Invalid Input')
      end
    end

    describe 'quit' do
      it 'returns quit symbol' do
        message = runner.parse_input('quit')
        expect(message).to eq(:quit)
      end
    end
  end
end
