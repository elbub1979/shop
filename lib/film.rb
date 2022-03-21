class Film < Product
  attr_accessor :title, :director, :year

  class << self
    def from_file(path)
      array = File.readlines(path, chomp: true)
      new(Hash(title: array[0], year: array[1], director: array[2],
               price: array[3], quantity: array[4]))
    end
  end

  def initialize(args)
    @title = args[:title]
    @director = args[:director]
    @year = args[:year]
    super(args)
  end

  def to_s
    "Фильм #{@title}, #{@year}, реж. #{@director}, #{@price} руб. (осталось #{@quantity})"
  end

  def update(args)
    args.each do |key, value|
      case key
      when :year then @year = value
      end
      super
    end
  end
end
