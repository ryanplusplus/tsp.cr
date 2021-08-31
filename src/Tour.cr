module Tour
  def self.length(tour, distances)
    length = 0
    (0...tour.size - 1).each do |i|
      length += distances[tour[i]][tour[i + 1]]
    end
    length += distances[tour.last][tour.first]
    length
  end

  def self.build(cities, distances)
    tour = [cities[0], cities[0]]

    (1...cities.size).each do |i|
      new_city = cities[i]
      min = Int32::MAX
      min_insert_index = 0

      (1...tour.size).each do |insert_index|
        to = distances[tour[insert_index - 1]][new_city]
        from = distances[new_city][tour[insert_index]]
        old = distances[tour[insert_index - 1]][tour[insert_index]]
        delta = to + from - old

        if delta < min
          min = delta
          min_insert_index = insert_index
        end
      end

      tour.insert(min_insert_index, new_city)
    end

    tour.pop

    return tour
  end
end
