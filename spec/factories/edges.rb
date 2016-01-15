FactoryGirl.define do
  factory :edge do
    association :graph
    association :target, factory: :node
    association :source, factory: :node
  end

end
