FactoryGirl.define do
  factory :edges_mapping do
    association :graphs_mapping
    association :branch, factory: :edge
  end
end
