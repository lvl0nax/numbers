class MaxNumbers::NumbersFinder
  attr_accessor :array, :n

  def initialize(n)
    @n = n
    @array = []
  end

  def call(stdin)
    number = nil
    loop do
      char = stdin.read(1)
      break if char.nil?

      (number ||= '') << char and next if digit?(char)
      next if number.nil? || number.empty?

      insert(number.to_i)
      number = nil
    end
    puts array.join(', ')
  end

  def insert(number)
    array << number and return if array.empty?
    item = array.bsearch { |num| num >= number}
    position = item && array.index(item) || -1
    array.insert(position, number)
    array.shift if array.size > n
  end

  def digit?(char)
    char =~ /[[:digit:]]/
  end
end
