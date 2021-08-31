require "spec"
require "../src/Tour"

describe Tour do
  describe "length" do
    it "should calculate the length of a tour" do
      distances = [
        [0, 12, 13, 4],
        [12, 0, 23, 5],
        [13, 23, 0, 6],
        [4, 5, 6, 0],
      ]

      Tour.length([1, 2, 0, 3], distances).should eq(23 + 13 + 4 + 5)
    end
  end

  describe "build" do
    distances = [
      [0, 2, 5, 1],
      [2, 0, 3, 2],
      [5, 4, 0, 5],
      [1, 2, 5, 0],
    ]

    it "should build a tour with only a single city" do
      Tour.build([0], distances).should eq([0])
    end

    it "should build a tour with two cities" do
      Tour.build([0, 1], distances).should eq([0, 1])
    end

    it "should build tours with more cities by inserting the next city optimally" do
      Tour.build([0, 1, 2], distances).should eq([0, 1, 2])
      Tour.build([0, 1, 2, 3], distances).should eq([0, 3, 1, 2])
    end
  end
end
