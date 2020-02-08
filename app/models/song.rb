class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.try(:name)
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  # def notes_attributes=(content)
  #   content.each do |id|
  #     note = Note.find(id)
  #     self.notes << note
  #   end
  # end
  
  # def notes_attributes
  #   self.notes_attributes.try(:content).to_string
    
  # end
end
