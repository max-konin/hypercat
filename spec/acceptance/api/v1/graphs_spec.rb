require 'rails_helper'

resource 'Graphs' do
  let!(:hypernet){create :hypernet, name: 'example'}
  let(:hypernet_id){hypernet.id}

  get '/api/v1/graphs.json' do
    let!(:graph_1){create :graph, hypernet: hypernet}
    let!(:graph_2){create :graph, hypernet: hypernet}


    parameter :hypernet_id, "Hypernet's ID", required: true

    example "Listing graphs in hypernet" do
      explanation 'Returns list of graph in hypernet'

      do_request

      expect(status).to eq 200
    end
  end

  get '/api/v1/graphs/:id.json' do
    parameter :id, "Graph's ID", required: true
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:graph){create :graph, hypernet: hypernet}
    let(:id){graph.id}

    example 'Get a graphs by id' do
      explanation 'Returns a graphs by ID'

      do_request

      expect(status).to eq 200
      expect(response_body).to eq GraphSerializer.new(graph).to_json
    end
  end

  post '/api/v1/graphs.json' do
    parameter :name, "Graph's name", required: true, scope: :graph
    parameter :hypernet_id, "Hypernet's ID", required: true

    let(:name) {'G'}

    example 'Creating a graph' do
      explanation 'Create new hypernet in DB'

      expect{do_request}.to change{Graph.count}.by(1)

      expect(status).to eq 201
    end
  end

  delete '/api/v1/graphs/:id.json' do
    parameter :id, "Graph's ID", required: true
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:graph){create :graph, hypernet: hypernet}
    let(:id){graph.id}

    example 'Delete graph by ID' do
      explanation 'Delete a hypernet by ID'

      expect{do_request}.to change{Graph.count}.by(-1)
    end
  end

  put '/api/v1/graphs/:id.json' do
    parameter :id, "Hypernet's ID", required: true
    parameter :name, "Graph's name", scope: :graph
    parameter :hypernet_id, "Hypernet's ID", required: true

    let!(:graph){create :graph, hypernet: hypernet}
    let(:id){graph.id}

    let(:name) {'H'}

    example 'Update a graph' do
      explanation 'Update a graph'


      expect{do_request}.to change{graph.reload.name}.to(name)
      expect(status).to eq 204
    end
  end
end