require 'rails_helper'
require Rails.root.join('lib/hypercat/list_builder/graph_adjacency')

describe Hypercat::ListBuilder::GraphAdjacency do
  let(:hypernet)     { create :hypernet }
  let(:graph)        { GraphGenerator::Grid.new(hypernet, n: 2, m: 2).generate 'G1' }
  let(:list_builder) { Hypercat::ListBuilder::GraphAdjacency.new graph }
  
  describe '#result' do
    let(:expected_list) do
      nodes = graph.nodes.to_a
      [
          {'_id' => nodes[0].id, 'node_ids' => [nodes[2].id, nodes[1].id]},
          {'_id' => nodes[1].id, 'node_ids' => [nodes[3].id, nodes[0].id]},
          {'_id' => nodes[2].id, 'node_ids' => [nodes[3].id, nodes[0].id]},
          {'_id' => nodes[3].id, 'node_ids' => [nodes[1].id, nodes[2].id]}
      ]
    end
    
    subject { list_builder.result.to_a }

    it 'returns an adjacency list of graph' do
      expect(subject).to eq expected_list
    end
  end
end