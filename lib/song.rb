require 'pry'

class Song
  
  attr_accessor :name, :artist_name

  # song1 = Song.new
  # song1.name="something"
  # song1.artist_name = "something else"
  
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	song = self.new
  	@@all << song
    song
  end

  def self.new_by_name(song_name)

    song = self.new
    song.name = song_name
    song

  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
    # binding.pry
  end

  def self.find_by_name(song_name)
    @@all.detect do |song|
      if song.name == song_name
        song.name
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name.downcase }
  end

  def self.new_from_filename(song_file_mp3)
      song_file = song_file_mp3.gsub(".mp3", "").split(" - ")
      artist_name = song_file[0]
      song_name = song_file[1]
      
      song = self.new

      song.name = song_name
      song.artist_name = artist_name
      song
      # binding.pry

  end
      
   

  def self.create_from_filename(song_file_mp3)
    song_file = song_file_mp3.gsub(".mp3", "").split(" - ")
      artist_name = song_file[0]
      song_name = song_file[1]

      song = self.create
      song.name = song_name
      song.artist_name = artist_name
      song

  end

  def self.destroy_all
  	self.all.clear
  end

end

Pry.start


