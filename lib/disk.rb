class Disk < Product
  attr_accessor :album, :musician, :genre, :year

  class << self
    def from_file(path)
      array = File.readlines(path, chomp: true)
      new(Hash(album: array[0], musician: array[1], genre: array[2], year: array[3],
               price: array[3], quantity: array[4]))
    end
  end

  def initialize(args)
    @album = args[:album]
    @musician = args[:musician]
    @genre = args[:genre]
    @year = args[:year]
    super(args)
  end

  def to_s
    "Альбом #{@musician} - #{@album}, #{@genre}, #{@year}, #{@price} руб. (осталось #{@quantity})"
  end

  def update(args)
    args.each do |key, value|
      case key
      when :album then @album = value
      when :musician then @musician = value
      when :genre then @genre = value
      when :year then @year = value
      end
      super
    end
  end
end

