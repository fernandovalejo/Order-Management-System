require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do 
    create(:status_pending)
    create(:status_in_progress)
    create(:status_completed)
  end
  
  context "Valid status_id" do
    it "is valid" do
      order = build(:order_pending)
      expect(order).to be_valid
    end
    
    it "not exist" do
      order = build(:order_default)
      order.status_id = 55
      expect{order.save!}.to raise_error('Validation failed: Status must exist')
    end
    
    it "can't be null" do
      order = build(:order_default)
      expect{order.save!}.to raise_exception('Validation failed: Status must exist')
    end
  end
  
  context "Validation Change Status" do
    it "Pending to In Progress" do
      order = create(:order_pending)
      expect(order.update(status_id: 2)).to be_truthy
    end
    
    it "Pending to Completed" do
      order = create(:order_pending)
      expect(order.update(status_id: 3)).to be_falsey
    end
    
    it "In Progress to Pending" do
      order = create(:order_in_progress)
      expect(order.update(status_id: 1)).to be_falsey
    end
    
    it "In Progress to Completed" do
      order = create(:order_in_progress)
      expect(order.update(status_id: 3)).to be_truthy
    end
    
    it "Completed to pending" do
      order = create(:order_completed)
      expect(order.update(status_id: 1)).to be_falsey
    end
    
    it "Completed to In Progress" do
      order = create(:order_completed)
      expect(order.update(status_id: 2)).to be_falsey
    end
  end
  
  
  context "Validation Control Number" do
    it "Valid Control Number" do
      order = create(:order_full_params)
      expect(order).to be_valid
    end
    
    it "Control number can't be blank" do
      order = build(:order_no_control_number)
      expect(order).to_not be_valid
    end
  end
  
  context "Validation Description" do
    it "Valid Description" do
      order = create(:order_full_params)
      expect(order).to be_valid
    end
    
    it "Description can't be null" do
      order = build(:order_no_description)
      expect(order).to_not be_valid
    end
  end
end
