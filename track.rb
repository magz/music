class Track
  attr_accessor :artist, :title, :played
  def initialize(artist, title)
    @artist = artist
    @title = title
    @played = false
  end

  def played?
    played == true
  end

  def play
    @played = true
  end
end