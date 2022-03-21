class Book < Product
  attr_accessor :title, :author, :genre

  class << self
    def from_file(path)
      array = File.readlines(path, chomp: true)
      new(Hash(title: array[0], genre: array[1], author: array[2],
               price: array[3], quantity: array[4]))
    end
  end

  def initialize(args)
    @title = args[:title]
    @author = args[:author]
    @genre = args[:genre]
    super(args)
  end

  def to_s
    "Книга #{@title}, #{@genre}, автор - #{@author}, #{@price} руб. (осталось #{@quantity})"
  end

  def update(args)
    args.each do |key, value|
      case key
      when :title then @title = value
      when :author then @author = value
      when :genre then @genre = value
      end
      super
    end
  end
end
