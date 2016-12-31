require 'rspec'
require_relative '../lib/knapsack'

RSpec.describe 'Knapsack' do
  describe 'Knapsack' do
    it 'run algoritm' do
      mass = [1, 4, 5, 7]
      value = [1, 5, 7, 9]
      capacity = 11
      problem = Knapsack.new(capacity, mass, value)
      expect(problem.run_algorithm).to eq(14)
      expect(problem.find_selected_items).to eq([4, 2])
    end
  end
end