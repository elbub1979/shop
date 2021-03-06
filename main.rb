require_relative 'lib/product'
require_relative 'lib/product_collection'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'

choice = 1
purchases = []
products_collection = ProductCollection.from_dir(__dir__)
products_collection.sort!(key: :title)

until choice.zero?
  puts 'Вот какие товары у нас есть:'
  puts

  puts products_collection.to_s
  puts '0. Выход'
  puts

  choice = gets.to_i

  if choice.between?(1, products_collection.to_a.size)
    product = products_collection.to_a[choice - 1]
    purchases << product
    product.quantity -= 1
    choice = 1
  else
    puts 'Неверный выбор. Выбирайте из представленного диапазона'
  end

  puts
  puts "Вы выбрали: #{product}"

  puts
  puts "Всего товаров на сумму: #{purchases.sum(&:price)} руб."
  puts
end

puts 'Вы купили:'
puts
puts purchases
puts
puts "С Вас — #{purchases.sum(&:price)} руб. Спасибо за покупки!"





