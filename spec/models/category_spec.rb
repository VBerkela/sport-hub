require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      category = Category.new(description: 'Very interesting category').save
      expect(category).to eq(false)
    end

    it 'ensures description presence' do
      category = Category.new(name: 'Test').save
      expect(category).to eq(false)
    end

    it 'should save successfully' do
      category = Category.new(name: 'Test', description: 'Very interesting category').save
      expect(category).to eq(true)
    end
  end

  context 'scope tests' do

  end
end
