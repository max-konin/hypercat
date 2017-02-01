FactoryGirl.define do
  factory :edge do
    association :graph
    nodes { [(create :node), create(:node)] }
    name 'E'
  end

end
