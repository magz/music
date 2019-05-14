require './track.rb'


class Library
  attr_accessor :tracks
  def initialize
    @tracks = []
  end

  def find_track_by_title(title)
    @tracks.find { |t| t.title == title }
  end

  def find_tracks_by_artist(artist)
    @tracks.select { |t| t.artist == artist}
  end

  def add_track(artist, title)
    if find_track_by_title(title)
      false
    else
      track = Track.new(artist, title)
      @tracks << track
      track
    end
  end

  def unplayed_tracks_by_artist(artist)
    unplayed(find_tracks_by_artist(artist))
  end

  def unplayed(track_query = nil)
    track_query ||= @tracks
    track_query.reject { |t| t.played? }
  end

  def play_track(title)
    track = find_track_by_title(title)
    track.play if track
  end
end
