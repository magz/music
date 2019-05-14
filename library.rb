class Library
  attr_accessor :tracks
  def initialize
    @tracks = []
  end

  def add_track(title, artist)
    @tracks << [title, artist]
  end

  def play_track(title, artist)
    # find_track(title, artist).play
  end
end
