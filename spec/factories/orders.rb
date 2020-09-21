FactoryBot.define do
  factory :order do
    
    trait :pending do
      status_id { 1 }
    end
    
    trait :in_progress do
      status_id { 2 }
    end
    
    trait :completed do
      status_id { 3 }
    end
    
    trait :default do
      control_number  { DateTime.now.strftime("%Y%m%d%H%M%S%L") }
      description { "TEST" }
    end
    
    trait :no_control_number do
      description { "TEST" }
    end
    
    trait :no_description do      
      control_number  { DateTime.now.strftime("%Y%m%d%H%M%S%L") }      
    end
    
    factory :order_default,           traits: [:default]
    factory :order_pending,           traits: [:default, :pending]
    factory :order_in_progress,       traits: [:default, :in_progress]
    factory :order_completed,         traits: [:default, :completed]
    factory :order_no_control_number, traits: [:no_control_number, :pending]
    factory :order_no_description,    traits: [:no_description, :pending]
    factory :order_full_params,       traits: [:default, :pending]
    
  end
end