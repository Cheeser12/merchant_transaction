require 'spec_helper'

describe 'application root' do
  it 'routes to the merchant transactions report' do
    expect(:get => '/').to route_to(
      controller: "reports",
      action:     "merchant_transactions_report")
  end
end
