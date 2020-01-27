# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DataStructures::List do
  subject { described_class.new }

  let(:list) { subject }

  describe '#append' do
    let(:value) { Random.rand(100) }

    it 'increases length' do
      list.append(2)
      expect(list.depth).to eq(0)
    end

    it 'initialize a Node with right options' do
      expect(DataStructures::List::Node).to receive(:new)
        .with(2, 0)

      list.append(2)
    end

    context 'when one node' do
      it 'returns list with valid node' do
        list.append(value)

        expect(list.first).to be_kind_of(DataStructures::List::Node)
        expect(list.first.value).to eq(value)
      end
    end

    context 'when multiple nodes' do
      context 'when second node is inserted' do
        let!(:first_node) { list.append(5).first }
        let(:next_value) { 10 }

        it 'sets pointer for the first node' do
          list.append(next_value)

          expect(first_node.next_node.value).to eq(next_value)
        end
      end
    end
  end

  describe '#to_a' do
    context 'when list is empty' do
      it 'returns []' do
        expect(list.to_a).to eq([])
      end
    end

    context 'when list is not empty' do
      let(:values) { Array.new(1000) { Random.rand(10) } }

      before do
        values.each { |value| list.append(value) }
      end

      it 'returns right array' do
        expect(list.to_a).to eq(values)
      end
    end
  end

  describe '#reverse' do
    context 'when empty' do
      it 'raises error' do
        expect { list.reverse }.to raise_error
      end
    end

    context 'when there is only one node' do
      it 'returns right node' do
        list.append(2)

        first_node = list.first

        expect(list.reverse).to eq(list.first)
      end
    end

    context 'when there are mutiple nodes' do
      let(:values) { [1,2,3] }

      before do
        values.each do |value|
          list.append(value)
        end
      end

      it 'chages nodes order' do
        list.reverse

        expect(list.first.value).to eq(values.last)
      end

      it 'changes indexes of nodes' do
        list.reverse

        expect(list.first.index).to eq(0)
        expect(list.first.next_node.index).to eq(1)
        expect(list.first.next_node.next_node.index).to eq(2)
      end
    end
  end
end
