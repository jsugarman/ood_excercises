require 'spec_helper'

RSpec.describe Gear, :model do
  subject { Gear.new( { chainring: 10, cog: 20, wheel: Wheel.new(50,2) }) }

  it { expect(subject).to respond_to :chainring }
  it { expect(subject).to respond_to :cog }
  it { expect(subject).to respond_to :wheel }

  describe '#ratio' do
    it 'multiplies chainring by cog teeth' do
      expect(subject.ratio).to eql 0.5
    end
  end

  describe '#gear_inches' do
    it 'calculates gear inches based on ratio, rim and tire' do
      expect(subject.gear_inches).to eql 27.00
    end
  end

end