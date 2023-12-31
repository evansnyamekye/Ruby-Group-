require_relative '../modules/storage'

class Author
  include StorageModule
  attr_reader :id, :first_name, :last_name, :items

  def initialize(first_name:, last_name:)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      items: @items.map(&:to_hash)
    }
  end
end
