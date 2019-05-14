require './library.rb'

class Runner
  attr_accessor :library
  def initialize
    @library = Library.new
  end

  def parse_input(str)
    case str
    when /^add "(.*)" "(.*)"/
      track = library.add_track($2, $1)
      if track
        "Added #{track.display_name(:title_and_artist)}"
      else
        "Track with title \"#{$1}\ already exists"
      end
    when /^play "(.*)"/
      track = library.play_track($1)
      if track
        "You're listening to #{track.display_name(:title)}"
      else
        "Track \"#{$1}\" not found"
      end
    when /^show all by "(.*)"/
      library.find_tracks_by_artist($1).map { |t| t.display_name(:full) }
    when /^show all/
      library.tracks.map { |t| t.display_name(:full) }
    when /^show unplayed by "(.*)"/
      library.unplayed_tracks_by_artist($1).map do |t|
        t.display_name(:title_and_artist)
      end
    when /^show unplayed/
      library.unplayed.map { |t| t.display_name(:title_and_artist) }
    when /^quit/
      :quit
    else
      'Invalid Input'
    end

  end
end
