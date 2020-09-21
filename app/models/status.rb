class Status < ApplicationRecord
  has_many :orders

  validates :description, presence: true, uniqueness: true
  
  def description=(description)
    super description.upcase if description
  end
  
  def to_s
    description
  end
end
