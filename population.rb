test = [
  { birth: 1950, death: 1989 },
  { birth: 1910, death: 1961 },
  { birth: 1922, death: 1948 },
  { birth: 1956, death: 1978 },
  { birth: 1913, death: 1941 },
  { birth: 1926, death: 1941 },
  { birth: 1924, death: 1938 },
  { birth: 1943, death: 1944 },
  { birth: 1931, death: 1965 },
  { birth: 1944, death: 1999 },
]

def seek(people)
  # O(N•4)
  first_birth = people.map { |p| p[:birth] }.min
  last_death = people.map  { |p| p[:death] }.max

  puts "#{first_birth} -> #{last_death}"
  population = Array.new(last_death - first_birth, 0)
  puts population.length

  #O(N)
  people.each do |p|
    birth_index = p[:birth] - first_birth
    death_index = p[:death] - first_birth

    population[birth_index] = (population[birth_index] || 0) + 1
    population[death_index] = (population[death_index] || 0) - 1
  end
  puts population.join(',')
  alive = 0

  # O(Y)
  population.map! do |p|
    alive += p
  end
  puts population.join(',')

  # O(Y)
  puts first_birth + population.each_with_index.max[1]
end

def seek_2(people)
  population = []

  # O(N)
  people.each do |p|
    population << { year: p[:death], change: -1 }
    population << { year: p[:birth], change: 1 }
  end

  # O(n LOG n)
  population.sort! { |a,b| a[:year] <=> b[:year] }

  cumulative = 0
  best = 0
  year = 0

  # O(N•2)
  population.each do |p|
    cumulative = cumulative + p[:change]
    if cumulative > best
      year = p[:year]
      best = cumulative
    end
  end

  puts "#{year} => #{best}"
end

seek_2(test)


