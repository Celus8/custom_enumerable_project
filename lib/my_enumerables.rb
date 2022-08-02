module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..(self.length - 1) do
      yield self[i], i
    end
    self
  end

  def my_select
    new_arr = []
    my_each do |value|
      new_arr << value if yield(value)
    end
    new_arr
  end

  def my_all?
    pass = true
    my_each do |value|
      pass = false unless yield(value)
    end
    pass
  end

  def my_any?
    pass = false
    my_each do |value|
      pass = true if yield(value)
    end
    pass
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count
    return self.length unless block_given?

    counter = 0
    my_each { |value| counter += 1 if yield(value) }
    counter
  end

  def my_map
    new_array = []
    my_each_with_index do |value, index|
      new_array[index] = yield(self[index])
    end
    new_array
  end

  def my_inject(initial_value)
    accumulator = initial_value
    my_each { |value| accumulator = yield(accumulator, value) }
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..(self.length - 1) do
      yield self[i]
    end
    self
  end
end
