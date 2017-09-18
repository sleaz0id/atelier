
require "rails_helper"

RSpec.describe 'routes to the home controller', type: :routing do
  describe 'routing' do
    it { expect(get: '/').to route_to('home#index') }
  end
end
