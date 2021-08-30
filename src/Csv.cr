module Csv
  def self.import(csv : String)
    lines = csv.split('\n')
    cities = lines.first.split(',').skip(1).select(&.size.positive?).map(&.gsub('"', ""))
    distances = Array.new(cities.size, 0).map { |_| Array.new(cities.size, 0) }

    lines.skip(1).each_with_index do |line, from|
      line.split(',').skip(1).select(&.size.positive?).each_with_index do |distance, to|
        distances[from][to] = distance.to_i
      end
    end

    {cities, distances}
  end
end
