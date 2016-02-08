FactoryGirl.define do
  factory :mapping do
    association :hypernet
    association :branch, factory: :edge
  end
end
