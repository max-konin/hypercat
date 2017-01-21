require 'rails_helper'

resource 'Graph Mappings' do
  let!(:hypernet){create :hypernet, name: 'example'}
  let(:hypernet_id){hypernet.id}

  get '/api/v1/graphs_mappings.json' do
    let!(:mapping_1){create :graphs_mapping, hypernet: hypernet}
    let!(:mapping_2){create :graphs_mapping, hypernet: hypernet}


    parameter :hypernet_id, "Hypernet's ID", required: true

    example "Listing mappings in hypernet" do
      explanation 'Returns list of mapping in hypernet'

      do_request

      expect(status).to eq 200
    end
  end

  get '/api/v1/graphs_mappings/:id.json' do
    parameter :id, "Mapping's ID", required: true
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:mapping){create :graphs_mapping, hypernet: hypernet}
    let(:id){mapping.id}

    example 'Get a mappings by id' do
      explanation 'Returns a mappings by ID'

      do_request

      expect(status).to eq 200
      expect(response_body).to eq GraphsMappingSerializer.new(mapping).to_json
    end
  end

  post '/api/v1/graphs_mappings.json' do
    parameter :source_id, "primary network (graph)", scope: :graphs_mapping, required: true
    parameter :target_id, "secondary network (graph)", scope: :graphs_mapping
    parameter :hypernet_id, "Hypernet's ID", required: true

    let(:source_id) { (create :graph).id }
    let(:target_id) { (create :graph).id }

    example 'Creating a mapping' do
      explanation 'Create new hypernet in DB'
      expect{do_request}.to change{GraphsMapping.count}.by(1)

      expect(status).to eq 201
    end
  end

  delete '/api/v1/graphs_mappings/:id.json' do
    parameter :id, "Mapping's ID", required: true
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:mapping){create :graphs_mapping, hypernet: hypernet}
    let(:id){mapping.id}

    example 'Delete mapping by ID' do
      explanation 'Delete a hypernet by ID'

      expect{do_request}.to change{GraphsMapping.count}.by(-1)
    end
  end

  put '/api/v1/graphs_mappings/:id.json' do
    parameter :source_id, "primary network (graph)", scope: :graphs_mapping, required: true
    parameter :target_id, "secondary network (graph)", scope: :graphs_mapping
    parameter :hypernet_id, "Hypernet's ID", required: true

    let(:source_id) { (create :graph).id }
    let(:target_id) { (create :graph).id }

    let!(:mapping){create :graphs_mapping, hypernet: hypernet}
    let(:id){mapping.id}

    let(:data) {{'name' => 'last mapping'}.to_json}

    example 'Update a mapping' do
      explanation 'Update a mapping'


      do_request
      expect(status).to eq 204
    end
  end
end