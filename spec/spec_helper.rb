require 'rspec'
require 'max_numbers'

class FakeStdin
  def initialize(str)
    @ar = str.split('')
  end

  def read(len)
    @ar.shift(len).first
  end
end
