require "rails_helper"

RSpec.describe 'routes to the books', type: :routing do
  it { expect(get: '/').to route_to('books#index') }

  it { expect(get: 'books').to route_to('books#index') }
  it { expect(post: 'books').to route_to('books#create') }
  it { expect(get: 'books/new').to route_to('books#new') }
  it { expect(get: 'books/1').to route_to('books#show', id: '1') }
  it { expect(get: 'books/filter').to route_to('books#filter') }

  it { expect(patch: 'books/1').not_to be_routable }
  it { expect(put: 'books/1').not_to be_routable }
  it { expect(get: 'books/1/edit').not_to be_routable }
  it { expect(delete: 'books/1').not_to be_routable }
end

