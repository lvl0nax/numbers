require 'spec_helper'

describe MaxNumbers::NumbersFinder do

  let!(:finder) { described_class.new(3) }

  describe '#digits?' do
    it 'returns truthy value with digit' do
      expect(finder.digit?('5')).to be_truthy
    end

    it 'returns falsey value with letter' do
      expect(finder.digit?('a')).to be_falsey
    end

    it 'returns falsey value with space' do
      expect(finder.digit?(' ')).to be_falsey
    end

    it 'returns falsey value with common' do
      expect(finder.digit?(',')).to be_falsey
    end
  end

  describe '#insert' do
    it 'should append digit in empty array' do
      finder.insert(5)
      expect(finder.array).to eq([5])
    end

    it 'should append digit in correct position for not full array' do
      finder.array = [1,5]
      finder.insert(9)
      expect(finder.array).to eq([1,5,9])
    end

    it 'should change full array' do
      finder.array = [2,5,9]
      finder.insert(7)
      expect(finder.array).to eq([5,7,9])
    end

    it 'should not change array with insertion too small value' do
      finder.array = [2,5,9]
      finder.insert(1)
      expect(finder.array).to eq([2,5,9])
    end
  end

  describe '#find' do
    it 'should build correct array' do
      finder.call(FakeStdin.new('00003 123 234 ,456a 12'))
      expect(finder.array).to eq([123, 234, 456])
    end
  end
end
