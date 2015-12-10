require 'rails_helper'

resource 'Hypernets' do
  get '/api/v1/hypernets.json' do
    let!(:hypernet){create :hypernet, name: 'example'}

    example "Listing hypernets" do
      explanation 'Returns list of hypernet in DB'

      do_request

      expect(status).to eq 200
    end
  end

  get '/api/v1/hypernets/:id.json' do
    parameter :id, "Hypernet's ID", required: true

    let!(:hypernet){create :hypernet, name: 'example'}
    let(:id){hypernet.id}

    example 'Get a hypernet by id' do
      explanation 'Returns a hypernet by ID'

      do_request

      expect(status).to eq 200
      expect(response_body).to eq hypernet.to_json
    end
  end

  post '/api/v1/hypernets.json' do
    parameter :name, "Hypernet's name", scope: :hypernet

    let(:name) {'My hypernet'}

    example 'Creating a hypernet' do
      explanation 'Create new hypernet in DB'

      expect(params).to eq ({
        'hypernet' => {'name' => name}
      })

      expect{do_request}.to change{Hypernet.count}.by(1)

      expect(status).to eq 201
    end
  end
end