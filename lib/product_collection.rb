class ProductCollection
  attr_accessor :products_collections

  class << self
    def from_dir(dirname)
      paths_collection = Dir.glob(File.join(dirname, 'data/*/*'))
      products_type = Product.product_types
      products_collection = paths_collection.map do |path|
        key = path.split('/')[-2].to_sym
        products_type[key].from_file(path)
      end
      new(products_collection)
    end
  end

  def initialize(products_collections)
    @products_collections = products_collections
  end

  def to_s
    @products_collections.map.with_index(1) do |product, index|
      "#{index}: #{product}"
    end
  end

  def to_a
    @products_collections
  end

  def sort!(params)
    case params[:key]
    when :price then @products_collections.sort_by!(&:price)
    when :quantity then @products_collections.sort_by!(&:quantity)
    when :title then @products_collections.sort_by!(&:to_s)
    end
    reverse! if params[:order] == :desc

    self
  end
end
