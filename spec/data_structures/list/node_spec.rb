# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DataStructures::List::Node do
  subject { described_class.new(value, index) }

  describe '#initialize' do
    let(:index) { 0 }
    let(:value) { 20 }

    it 'sets value' do
      expect(subject.value).to eq(value)
    end

    it 'sets index' do
      expect(subject.index).to eq(index)
    end
  end
end
