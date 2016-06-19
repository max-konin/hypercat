FactoryGirl.define do
  factory :edges_mapping do
    association :hypernet
    association :branch, factory: :edge
  end
end
