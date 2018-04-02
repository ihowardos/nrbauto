FactoryGirl.define do
  factory :product do
    title
    description
    compatibility_model "MAN, Scania"
    compatibility_oem "4894-489-1089"
    category "other"
  end
end
