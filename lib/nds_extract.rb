$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  list = []
  count = 0
  while count < source.length do
    list << source[count][:name]
    count += 1
  end  
  list
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  def director_total(source, big_count)
    this_dir_total = 0
    dir_tot = 0
    dir_index = source[big_count].length
    while count < dir_index do
      this_dir_total += source[big_count][:movies][count][:worldwide_gross]
      count += 1
    end
    this_dir_total
  end
  
  def big_total(source)
    big_count = 0
    big_tot = 0
    big_index = source.length
    while big_count < big_index do
      big_tot += director_total(source, big_count)
      big_count += 1
    end
    big_tot
  end
  big_total(source)
end


