FactoryGirl.define do
  factory :graphs_mapping do
    association :hypernet
    association :source, factory: :graph
    association :target, factory: :graph
  end
end

