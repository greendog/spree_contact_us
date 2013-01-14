require 'spec_helper'

# https://github.com/spree/spree/blob/5103b91fccfea93572a8611e8f374ddba6c04e95/core/lib/spree/core/testing_support/controller_requests.rb
describe Spree::InquiriesController do
  it "can respond to #new" do
    spree_get :new
  end

  it "can POST to #create" do
    spree_post :create
  end

  context "using a reCAPTCHA," do
    before do
      Spree::Inquiry.any_instance.stub(:save => true)
      Spree::InquiriesController.any_instance.stub(:verify_recaptcha => true,
                                                   :use_recaptcha? => true)
      flash[:recaptcha_error].should be_blank
    end

    context "when valid," do
      it "should be successful" do
        spree_post :create
        response.should be_redirect
      end
    end

    context "when invalid," do
      before do
        Spree::InquiriesController.any_instance.stub(:verify_recaptcha => false)
      end

      it "should set the flash accrdingly" do
        spree_post :create
        response.should render_template(:new)
      end
    end

  end

end

