require 'rspec'
require_relative '../lib/knapsack'

RSpec.describe 'Knapsack' do
  describe 'Knapsack' do
    it 'run algoritm' do
      items = [
        {weight: 1, price: 1},
        {weight: 4, price: 5},
        {weight: 5, price: 7},
        {weight: 7, price: 9}
      ]
      problem = Knapsack.new(items)
      expect(problem.fill_the_bag(11)).to eq(14)
      expect(problem.inside_bag).to eq([
        {weight: 7, price: 9},
        {weight: 4, price: 5}])
      expect(problem.fill_the_bag(18)).to eq(22)
      expect(problem.inside_bag).to eq([
        {weight: 7, price: 9},
        {weight: 5, price: 7},
        {weight: 4, price: 5},
        {weight: 1, price: 1}])
      expect(problem.fill_the_bag(6)).to eq(8)
      expect(problem.inside_bag).to eq([
        {weight: 5, price: 7},
        {weight: 1, price: 1}
      ])
    end
  end
end