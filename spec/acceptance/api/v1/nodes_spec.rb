require 'rails_helper'

resource 'Nodes' do
  let!(:hypernet){create :hypernet, name: 'example'}
  let(:hypernet_id){hypernet.id}

  get '/api/v1/nodes.json' do
    let!(:node_1){create :node, hypernet: hypernet, data: {name: 'first node'}}
    let!(:node_2){create :node, hypernet: hypernet, data: {name: 'second node'}}


    parameter :hypernet_id, "Hypernet's ID", required: true

    example "Listing nodes in hypernet" do
      explanation 'Returns list of node in hypernet'

      do_request

      expect(status).to eq 200
    end
  end

  get '/api/v1/nodes/:id.json' do
    parameter :id, "Node's ID", required: true
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:node){create :node, hypernet: hypernet, data: {name: 'first node'}}
    let(:id){node.id}

    example 'Get a nodes by id' do
      explanation 'Returns a nodes by ID'

      do_request

      expect(status).to eq 200
      expect(response_body).to eq ActiveModel::SerializableResource.new(node).to_json
    end
  end

  post '/api/v1/nodes.json' do
    parameter :data, "Custom JSON data", scope: :node
    parameter :hypernet_id, "Hypernet's ID", required: true
    parameter :name, "Node's name", required: true, scope: :node

    let(:data) { {x: 1, y: 2}.to_json}
    let(:name) { 'v' }

    example 'Creating a node' do
      explanation 'Create new hypernet in DB'

      expect{do_request}.to change{Node.count}.by(1)

      expect(status).to eq 201
    end
  end

  delete '/api/v1/nodes/:id.json' do
    parameter :id, "Node's ID", required: true
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:node){create :node, hypernet: hypernet, data: {name: 'first node'}}
    let(:id){node.id}

    example 'Delete node by ID' do
      explanation 'Delete a hypernet by ID'

      expect{do_request}.to change{Node.count}.by(-1)
    end
  end

  put '/api/v1/nodes/:id.json' do
    parameter :id, "Hypernet's ID", required: true
    parameter :data, "Custom JSON data", scope: :node
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:node){create :node, hypernet: hypernet, data: {name: 'first node'}}
    let(:id){node.id}

    let(:data) {{'name' => 'last node'}.to_json}

    example 'Update a node' do
      explanation 'Update a node'


      expect{do_request}.to change{node.reload.data[:name]}.to('last node')
      expect(status).to eq 204
    end
  end
end