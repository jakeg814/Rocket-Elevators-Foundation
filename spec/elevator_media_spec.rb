require "ElevatorMedia"

RSpec.describe ElevatorMedia::Streamer do
    describe ".getContent" do
        streamer = ElevatorMedia::Streamer.new
        context 'output type' do 
           it 'returns HTML iFrame' do
              expect(streamer.getContent()).to be_kind_of String
           end
        end
    end
end