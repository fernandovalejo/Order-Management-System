class Order < ApplicationRecord
  belongs_to :status
  
  validates :description, :control_number, presence: true  
  validate :status_validate, on: :update
  
  def status_validate
    old = Order.find(id)
    
    if old.status_id == 1 and status_id == 3
      errors.add(:status_id, "cannot be concluded")
      
    elsif (old.status_id == 2 and status_id == 1) 
      errors.add(:status_id, "cannot be pending")
      
    elsif (old.status_id == 3 and status_id == 1)
      errors.add(:status_id, "cannot be pending")
      
    elsif old.status_id == 3 and status_id == 2
      errors.add(:status_id, "cannot be progress")
    end    
  end
  
  def description=(description)
    super description.upcase if description
  end
end
