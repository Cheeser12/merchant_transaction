require 'spec_helper'

describe 'application root' do
  it 'routes to reports#index' do
    expect(:get => '/').to route_to("tables#index")
  end
end
