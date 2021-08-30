require "spec"
require "../src/Csv"

describe Csv do
  it "should generate a table of distances" do
    cities, distances = Csv.import("\
,\"city1\",\"city2\",\"city3\",
\"city1\",0,12,13,
\"city2\",12,0,23,
\"city3\",13,23,0,
")

    cities.should eq(["city1", "city2", "city3"])

    distances.should eq([
      [0.0, 12.0, 13.0],
      [12.0, 0.0, 23.0],
      [13.0, 23.0, 0.0],
    ])
  end
end
