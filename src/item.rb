class Item
  def initialize(id, genre, author, source, label, publish_date, archived: false)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end


  def can_be_archived?()
  end

  def move_to_archive()
  end
end