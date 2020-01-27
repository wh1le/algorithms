# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DataStructures::Stack do
  subject { described_class.new }

  describe '#push' do
    context 'when there is only one value to push' do
      it 'changes head to new node'
    end

    context 'when multiple values' do
      it 'links previous node to head'
    end
  end

  describe '#pop' do
    it 'changes head'
    it 'returns first value'
  end
end
