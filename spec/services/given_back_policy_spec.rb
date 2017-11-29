require 'rails_helper'

RSpec.describe GivenBackPolicy, type: :service do
  let(:user) { double }
  let(:book) { double }

  subject { described_class.new(user: user, book: book) }

  describe '#applies' do

  end
end
