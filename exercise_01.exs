# I spend a good bit of my day throwing around array of hashes in Ruby.
# So I'm gonna figure out how to do the following:
# 1. Create a map
# 2. Add another key-value pair to the existing map
# 3. Add several maps to a list
# 4. Map the list to the values of a certain key
# 5. Filter a list

# 1. Create a map
# Now, I like IPAs, it's my favorite type of beer. But maybe you don't even like beer.
# Pick some things that you do like. I really think that's an important piece of the puzzle.
# We're doing some new things. I know next to nothing about functional programming, so
# I want to surround myself with things I know about
# Maps have pretty similar syntax to Ruby's hash, just add the '%' at the beginning of the declaration

good_beer = %{ name: "Hopslam", brewery: "Bells" }

# => %{brewery: "Bells", name: "Hopslam"}

# but you know what, I probably want to add the ABV as well. How do I add another value to the map?
# I don't feel it's as intuitive as  Ruby in this regard, but maybe I'm doing somthing wrong.
# This is what I found.

favorite_beer = Map.put good_beer, :abv , 10
# => %{abv: 10.0, brewery: "Bells", name: "Hopslam"}

# De-referencing the maps should be pretty familiar to a Ruby developer.
# You can use a syntax very similar to Ruby hashes

favorite_beer[:brewery]
# => "Bells"


# And also with dot notation
favorite_beer.brewery
# => "Bells"

# but they don't behave the same way with unknown keys
favorite_beer[:color]
# => nil

favorite_beer.color
# ** (KeyError) key :color not found in: %{abv: 10, brewery: "Bells", name: "Hopslam"}

# Let's add a couple more
second_favorite_beer = %{ name: "Hoptimum", brewery: "Sierra Nevada", abv: 10.04 }
# => %{abv: 10.04, brewery: "Sierra Nevada", name: "Hoptimum"}

third_favorite_beer = %{ name: "Two Hearted Ale", brewery: "Bells", abv: 7.0 }
# => %{abv: 7.0, brewery: "Bell's", name: "Two Hearted Ale"}


# And we'll make a list out of them

beer_list = [ favorite_beer, second_favorite_beer, third_favorite_beer ]

# we can use the Enum module to map and filter the list.
beer_names = Enum.map(beer_list, fn x -> x.name end)
# => ["Hopslam", "Hoptimum", "Two Hearted Ale"]

# filter is pretty much Ruby's #select/#collect
bells_beers = Enum.filter(beer_list, fn x -> x.brewery == "Bells" end)
# => [%{abv: 10, brewery: "Bells", name: "Hopslam"},
#     %{abv: 7.0, brewery: "Bells", name: "Two Hearted Ale"}]


# Cool. I now have a handful of expressions I can practice while the Home Run Derby.
