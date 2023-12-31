require_relative 'item'

class Book < Item
  attr_reader :publish_date, :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date: publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(option = {})
    {
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }.to_json(option)
  end
end
