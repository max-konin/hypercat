require 'rails_helper'

resource 'Graph Adjacency List' do
  let!(:hypernet){create :hypernet, name: 'example'}

  get '/api/v1/lists/graph_adjacency/:id.json' do
    parameter :id, "Graph's ID", required: true

    let!(:graph){ create :graph, hypernet: hypernet }
    let(:graph) { GraphGenerator::Grid.new(hypernet, n: 2, m: 2).generate 'G1' }
    let(:id)    { graph.id }

    example 'Get a list for graph' do
      explanation 'Returns an adjacency list for the graph'

      do_request

      expect(status).to eq 200
    end
  end
end