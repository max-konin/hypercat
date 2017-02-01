require 'rails_helper'

resource 'Edges' do
  let!(:graph){create :graph, name: 'example'}
  let(:graph_id){graph.id}

  get '/api/v1/edges.json' do
    let!(:edge_1){create :edge, graph: graph, data: {name: 'first edge'}}
    let!(:edge_2){create :edge, graph: graph, data: {name: 'second edge'}}


    parameter :graph_id, "Graph's ID", required: true

    example "Listing edges in graph" do
      explanation 'Returns list of edge in graph'

      do_request

      expect(status).to eq 200
    end
  end

  get '/api/v1/edges/:id.json' do
    parameter :id, "Edge's ID", required: true
    parameter :graph_id, "Graph's ID", required: true

    let!(:edge){create :edge, graph: graph, data: {name: 'first edge'}}
    let(:id){edge.id}

    example 'Get a edges by id' do
      explanation 'Returns a edges by ID'

      do_request

      expect(status).to eq 200
      expect(response_body).to eq EdgeSerializer.new(edge).to_json
    end
  end

  post '/api/v1/edges.json' do
    parameter :data, "Custom JSON data", scope: :edge
    parameter :graph_id, "Graph's ID", required: true, scope: :edge
    parameter :node_ids, "IDs of incident nodes", require: true, scope: :edge
    parameter :name, "Edge's name", require: true, scope: :edge

    let(:data) { {x: 1, y: 2}.to_json }
    let(:source_node) {create :node}
    let(:target_node) {create :node}
    let(:node_ids) { [source_node.id.to_s, target_node.id.to_s]}
    let(:name) { 'e' }

    example 'Creating a edge' do
      explanation 'Create new graph in DB'

      expect{do_request}.to change{Edge.count}.by(1)

      expect(status).to eq 201
    end
  end

  delete '/api/v1/edges/:id.json' do
    parameter :id, "Edge's ID", required: true
    parameter :graph_id, "Hypernet's ID", required: true

    let!(:edge){create :edge, graph: graph}
    let(:id){edge.id}

    example 'Delete edge by ID' do
      explanation 'Delete a edge by ID'

      expect{do_request}.to change{Edge.count}.by(-1)
    end
  end

  put '/api/v1/edges/:id.json' do
    parameter :id, "Graph's ID", required: true
    parameter :data, "Custom JSON data", scope: :edge
    parameter :node_ids, "IDs of incident nodes", require: true, scope: :edge
    parameter :graph_id, "Graph's ID", required: true

    let!(:edge){create :edge, graph: graph, data: {name: 'first edge'}}
    let(:node_ids) { edge.node_ids }

    let(:id){edge.id}

    let(:data) {{'name' => 'last edge'}.to_json}

    example 'Update a edge' do
      explanation 'Update a edge'


      expect{do_request}.to change{
        edge.reload.data[:name]
      }.to('last edge')
      expect(status).to eq 204
    end
  end
end