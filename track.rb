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
    self
  end

  def display_name(version)
    case version
    when :full
      "\"#{title}\" by #{artist} (#{played? ? 'played' : 'unplayed'})"
    when :title_and_artist
      "\"#{title}\" by #{artist}"
    when :title
      "\"#{title}\""
    end
  end
end
