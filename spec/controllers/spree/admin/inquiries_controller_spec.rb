require 'spec_helper'

describe Spree::Admin::InquiriesController do

  stub_authorization!

  it "responds to #index" do
    spree_get :index
    should respond_with(:success)
    assigns(:collection).should_not be_nil
  end

end

