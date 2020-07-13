FactoryBot.define do
  factory :expense do
    name { 'testname' }
    amount { 500 }
    author_id { 1 }
  end
end
