include RSpec

require_relative 'tsp_greed'

RSpec.describe City, type: Class do
  let (:chicago) { City.new("Chicago") }
  let (:seattle) { City.new("Seattle") }
  let (:los_angeles) { City.new("Los Angeles") }
  let (:fort_lauderdale) { City.new("Fort Lauderdale") }
  let (:new_york_city) { City.new("New York City") }
  let (:minneapolis) { City.new("Minneapolis") }
  let (:san_francisco) { City.new("San Francisco") }
  let (:dallas) { City.new("Dallas") }

  before do
    chicago.neighbors = [
      {
        city: seattle,
        distance: 2063.5
      },
      {
        city: los_angeles,
        distance: 2014.8
      },
      {
        city: fort_lauderdale,
        distance: 1354.4
      },
      {
        city: new_york_city,
        distance: 796.2
      },
      {
        city: minneapolis,
        distance: 408.9
      },
      {
        city: san_francisco,
        distance: 2131.3
      },
      {
        city: dallas,
        distance: 967.2
      }
    ]

    seattle.neighbors = [
      {
        city: chicago,
        distance: 2063.5
      },
      {
        city: los_angeles,
        distance: 1136.7
      },
      {
        city: fort_lauderdale,
        distance: 3274.1
      },
      {
        city: new_york_city,
        distance: 2865.1
      },
      {
        city: minneapolis,
        distance: 1656.4
      },
      {
        city: san_francisco,
        distance: 807.8
      },
      {
        city: dallas,
        distance: 2106.3
      }
    ]

    los_angeles.neighbors = [
      {
        city: chicago,
        distance: 2014.8
      },
      {
        city: seattle,
        distance: 1136.7
      },
      {
        city: fort_lauderdale,
        distance: 2710.6
      },
      {
        city: new_york_city,
        distance: 2795.9
      },
      {
        city: minneapolis,
        distance: 1925.8
      },
      {
        city: san_francisco,
        distance: 383.2
      },
      {
        city: dallas,
        distance: 1436.0
      }
    ]

    fort_lauderdale.neighbors = [
      {
        city: chicago,
        distance: 1354.4
      },
      {
        city: seattle,
        distance: 3274.1
      },
      {
        city: los_angeles,
        distance: 2710.6
      },
      {
        city: new_york_city,
        distance: 1256.1
      },
      {
        city: minneapolis,
        distance: 1766.5
      },
      {
        city: san_francisco,
        distance: 3091.5
      },
      {
        city: dallas,
        distance: 1290.4
      }
    ]

    new_york_city.neighbors = [
      {
        city: chicago,
        distance: 796.2
      },
      {
        city: seattle,
        distance: 2865.1
      },
      {
        city: los_angeles,
        distance: 2795.9
      },
      {
        city: fort_lauderdale,
        distance: 1256.1
      },
      {
        city: minneapolis,
        distance: 1209.5
      },
      {
        city: san_francisco,
        distance: 2912.6
      },
      {
        city: dallas,
        distance: 1548.7
      }
    ]

    minneapolis.neighbors = [
      {
        city: chicago,
        distance: 408.9
      },
      {
        city: seattle,
        distance: 1656.4
      },
      {
        city: los_angeles,
        distance: 1925.8
      },
      {
        city: fort_lauderdale,
        distance: 1766.5
      },
      {
        city: new_york_city,
        distance: 1209.5
      },
      {
        city: san_francisco,
        distance: 1966.1
      },
      {
        city: dallas,
        distance: 941.8
      }
    ]

    san_francisco.neighbors = [
      {
        city: chicago,
        distance: 2131.3
      },
      {
        city: seattle,
        distance: 807.8
      },
      {
        city: los_angeles,
        distance: 383.2
      },
      {
        city: fort_lauderdale,
        distance: 3091.5
      },
      {
        city: new_york_city,
        distance: 2912.6
      },
      {
        city: minneapolis,
        distance: 1966.1
      },
      {
        city: dallas,
        distance: 1728.7
      }
    ]

    dallas.neighbors = [
      {
        city: chicago,
        distance: 967.2
      },
      {
        city: seattle,
        distance: 2106.3
      },
      {
        city: los_angeles,
        distance: 1436.0
      },
      {
        city: fort_lauderdale,
        distance: 1290.4
      },
      {
        city: new_york_city,
        distance: 1548.7
      },
      {
        city: minneapolis,
        distance: 941.8
      },
      {
        city: san_francisco,
        distance: 1728.7
      }
    ]
  end

  describe "nearest_neighbor(cities, origin)" do
    # have to split up tests, otherwise all nodes must be reset between each test
    it "properly finds route from chicago to seattle" do
      cities = [seattle, los_angeles, fort_lauderdale, new_york_city]
      expect(nearest_neighbor(cities, chicago)).to eq ["Chicago", "New York City", "Fort Lauderdale", "Los Angeles", "Seattle"]
    end

    it "properly finds route from minneapolis to seattle" do
      cities = [chicago, seattle, los_angeles, new_york_city]
      expect(nearest_neighbor(cities, minneapolis)).to eq ["Minneapolis", "Chicago", "New York City", "Los Angeles", "Seattle"]
    end

    it "properly finds route from dallas to seattle" do
      cities = [seattle, los_angeles, chicago, minneapolis, san_francisco, fort_lauderdale, new_york_city]
      expect(nearest_neighbor(cities, dallas)).to eq ["Dallas",  "Minneapolis", "Chicago", "New York City", "Fort Lauderdale", "Los Angeles", "San Francisco", "Seattle"]
    end

    it "properly finds route from san francisco to new york city" do
      cities = [minneapolis, seattle, los_angeles, chicago, new_york_city]
      expect(nearest_neighbor(cities, san_francisco)).to eq ["San Francisco", "Los Angeles", "Seattle", "Minneapolis", "Chicago", "New York City"]
    end
  end
end
