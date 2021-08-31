module Csv
  def self.import(csv : String)
    lines = csv.split('\n')
    cities = lines.first.scan(/"[^"]+"/).map(&.[0].gsub('"', ""))
    distances = Array.new(cities.size, 0).map { |_| Array.new(cities.size, 0) }

    lines.skip(1).each_with_index do |line, from|
      line.gsub(/"[^"]+",/, "").split(',').select(&.size.positive?).each_with_index do |distance, to|
        distances[from][to] = distance.to_i
      end
    end

    {cities, distances}
  end
end
