class Product

  attr_accessor :price, :quantity

  class << self
    def product_types
      collections = ObjectSpace.each_object(Class).select { |klass| klass < self }
      Hash[collections.map { |product| ["#{product.to_s.downcase}s".to_sym, product] }]
    end

    def from_file(file_path)
      raise NotImplementedError
    end
  end

  def initialize(args)
    @price = args[:price].to_i
    @quantity = args[:quantity].to_i
  end

  def update(args)
    args.each do |key, value|
      case key
      when :quantity then @quantity = value
      when :price then @price = value
      end
    end
  end
end
