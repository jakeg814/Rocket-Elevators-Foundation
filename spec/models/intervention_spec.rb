require 'rails_helper'
RSpec.describe Intervention, :type => :model do
    it "is initialized with nil values" do
        expect(Intervention.new).to_not be_valid
    end

    it "is not valid without an employee"
    it "is not valid without a customer"
    it "is not valid without blah blah"
    it "is not valid without blah blah"
end