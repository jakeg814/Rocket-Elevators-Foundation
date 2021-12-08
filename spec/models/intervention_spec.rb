require 'rails_helper'
RSpec.describe Intervention, :type => :model do
    subject {
        described_class.new(user_id: 1, customer_id: 1, building_id: 1, battery_id: 1, column_id: 1, elevator_id: 1, employee_id: 1, intervention_start: '2017-09-23', intervention_end: '2021-09-25', result: 'successful', report: 'intervention', status: 'idle')
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a user" do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a customer" do
        subject.customer_id = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a building" do
        subject.building_id = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a battery" do
        subject.battery_id = nil
        expect(subject).to_not be_valid
    end
end