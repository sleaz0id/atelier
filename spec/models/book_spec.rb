require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { described_class.new }
  
  describe 'can be given back' do
    let(:user) { User.new }

    context 'without any reservations' do
      it { expect(GivenBackPolicy.new(user: user, book: subject).applies?).to be_falsey }
    end 

    context 'with reservation' do
      let(:reservation) { double }

      before { 
        allow(subject).to receive_message_chain(:reservations, :find_by)
                            .with(no_args).with(user: user, status: 'TAKEN')
                            .and_return(reservation)
      } 

      it {
        expect(GivenBackPolicy.new(user: user, book: subject).applies?).to be_truthy
      }

    end
  end
end
