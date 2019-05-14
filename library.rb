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

  def add_track(title, artist)
    @tracks << Track.new(title, artist)
  end

  def unplayed_by_artist(artist)
    find_tracks_by_artist(artist).unplayed
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
