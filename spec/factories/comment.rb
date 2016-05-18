

FactoryGirl.define do
  factory :comment do
    sequence :description do |n|
      "the contribution to the event test ##{n}"
    end
  end
end
