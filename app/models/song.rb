class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  # setter method to find or create artist by passing in instance of song in name argument

  def artist_name
    self.artist.name if self.artist
  end 
  # getter method if song exists then it'll return song with artist name

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(note_contents)
    note_contents.each do |content|
      unless content.empty?
        self.notes << Note.create(content: content)
        self.save
      end
    end
  end

  def note_contents
    self.notes.collect(&:content)
  end
end
