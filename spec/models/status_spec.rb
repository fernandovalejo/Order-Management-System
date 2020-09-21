require 'rails_helper'

RSpec.describe Status, type: :model do
  context "Valid description" do
    it "is valid" do      
      status = build(:status_pending)
      expect(status).to be_valid
    end

    it "unique" do      
      status = create(:status_pending)
      copy_description = Status.new(description: status.description)
      expect{copy_description.save!}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Description has already been taken')
    end
  end
end