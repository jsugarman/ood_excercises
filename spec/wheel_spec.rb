require 'spec_helper'

RSpec.describe Wheel, :model do
  subject { Wheel.new(50,2)}
  
  it { expect(subject).to be_instance_of Wheel }
  it { expect(subject).to respond_to :rim }
  it { expect(subject).to respond_to :tire }

  describe '#diameter' do
    it 'calculates wheel diameter from rim and tire' do
      expect(subject.diameter).to eq 54
    end
  end

  describe '#circumference' do
    it 'calculates circumference from PI * diameter' do
      expect(subject.circumference.round).to eq 170
    end
  end

end