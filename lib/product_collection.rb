class ProductCollection
  attr_accessor :products_collections

  class << self
    def from_dir(dirname)
      paths_collections = Dir.glob(File.join(dirname, 'data/*/*'))
      products_type = Product.product_types
      paths_collections.map do |path|
        key = path.split('/')[-2].to_sym
        products_type[key].from_file(path)
      end
    end
  end

  def initialize(products_collections)
    @products_collections = products_collections
  end

  def to_a
    @products_collections.to_a
  end

  def sort(params)
    collection = to_a
    case params[:key]
    when :price then collection.sort_by!(&:price)
    when :quantity then collection.sort_by!(&:quantity)
    when :title then collection.sort_by!(&:title)
    end
    collection.reverse! if params[:order] == :asc

    collection
  end
end
