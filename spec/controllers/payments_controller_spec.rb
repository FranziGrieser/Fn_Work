require 'rails_helper'
require 'stripe_mock'

RSpec.describe PaymentsController, type: :controller do

  it "mocks a declined card error" do
  # Prepares an error for the next create charge request
  StripeMock.prepare_card_error(:card_declined)

  expect { Stripe::Charge.create(amount: 1, currency: 'usd') }.to raise_error {|e|
    expect(e).to be_a Stripe::CardError
    expect(e.http_status).to eq(402)
    expect(e.code).to eq('card_declined')
  }
end

end
