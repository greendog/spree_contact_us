require 'spec_helper'

# https://github.com/spree/spree/blob/5103b91fccfea93572a8611e8f374ddba6c04e95/core/lib/spree/core/testing_support/controller_requests.rb
describe Spree::InquiriesController do
  it "can respond to #new" do
    spree_get :new
  end

  it "can POST to #create" do
    spree_post :create
  end
end

