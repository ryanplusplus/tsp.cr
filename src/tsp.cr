require "./*"

data_file = ARGV[0]

cities, distances = Csv.import(File.read(data_file))

city_indexes = (0...cities.size).to_a
min_tour = Tour.build(city_indexes, distances)
min_length = Tour.length(min_tour, distances)

(1...(ARGV[1] || 10).to_i).each do |_|
  city_indexes.shuffle!
  tour = Tour.build(city_indexes, distances)
  length = Tour.length(tour, distances)
  if length < min_length
    min_tour = tour
    min_length = length
  end
end

puts min_tour.map { |x| cities[x] }.join('\n')
puts
puts min_length
