FactoryBot.define do
  factory :status do
    factory :status_pending do
      id { 1 }
      description { 'PENDING' }
    end
    
    factory :status_in_progress do
      id { 2 }
      description { 'IN PROGRESS' }
    end

    factory :status_completed do
      id { 3 }
      description { 'COMPLETED' }
    end
  end
end