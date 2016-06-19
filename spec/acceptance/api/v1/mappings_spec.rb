require 'rails_helper'

resource 'Edges Mappings' do
  let!(:hypernet){create :hypernet, name: 'example'}
  let(:hypernet_id){hypernet.id}

  get '/api/v1/edges_mappings.json' do
    let!(:mapping_1){create :edges_mapping, hypernet: hypernet}
    let!(:mapping_2){create :edges_mapping, hypernet: hypernet}


    parameter :hypernet_id, "Hypernet's ID", required: true

    example "Listing mappings in hypernet" do
      explanation 'Returns list of mapping in hypernet'

      do_request

      expect(status).to eq 200
    end
  end

  get '/api/v1/edges_mappings/:id.json' do
    parameter :id, "Mapping's ID", required: true
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:mapping){create :edges_mapping, hypernet: hypernet}
    let(:id){mapping.id}

    example 'Get a mappings by id' do
      explanation 'Returns a mappings by ID'

      do_request

      expect(status).to eq 200
      expect(response_body).to eq EdgesMappingSerializer.new(mapping).to_json
    end
  end

  post '/api/v1/edges_mappings.json' do
    parameter :branch_id, "Edge of a primary network", scope: :edges_mapping, required: true
    parameter :edge_ids, "Edges of a secondary network", scope: :edges_mapping
    parameter :hypernet_id, "Hypernet's ID", required: true

    let(:edge_ids) { [(create :edge).id]}
    let(:branch_id) { (create :edge).id }

    example 'Creating a mapping' do
      explanation 'Create new hypernet in DB'
      expect{do_request}.to change{EdgesMapping.count}.by(1)

      expect(status).to eq 201
    end
  end

  delete '/api/v1/edges_mappings/:id.json' do
    parameter :id, "Mapping's ID", required: true
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:mapping){create :edges_mapping, hypernet: hypernet}
    let(:id){mapping.id}

    example 'Delete mapping by ID' do
      explanation 'Delete a hypernet by ID'

      expect{do_request}.to change{EdgesMapping.count}.by(-1)
    end
  end

  put '/api/v1/edges_mappings/:id.json' do
    parameter :branch_id, "Edge of a primary network", scope: :edges_mapping, required: true
    parameter :edge_ids, "Edges of a secondary network", scope: :edges_mapping
    parameter :hypernet_id, "Hypernet's ID", required: true

    let(:edge_ids) { [(create :edge).id]}
    let(:branch_id) { (create :edge).id }

    let!(:mapping){create :edges_mapping, hypernet: hypernet}
    let(:id){mapping.id}

    let(:data) {{'name' => 'last mapping'}.to_json}

    example 'Update a mapping' do
      explanation 'Update a mapping'


      expect{do_request}.to change{mapping.reload.branch.id}.to(branch_id)
      expect(status).to eq 204
    end
  end
end