require 'spec_helper'

describe Spree::InquiryMailer do

  describe 'mails' do

    let(:inquiry) { mock_model(Spree::Inquiry, :name => 'George Lucas',
                                               :email => 'lucas@example.com',
                                               :inquiry_type => 'Confessions',
                                               :message => 'I admit it, Empire Strikes Back was the best.',
                                               :http_remote_addr => '192.99.99.99',
                                               :http_user_agent => 'Mozilla MeganFox 4000') }

    before do
      Spree::InquiryMailer.any_instance.stub(:mail_from => 'test@example.com',
                                             :site_owner_email => 'admin@example.com')
    end

    describe 'notification' do

      let(:mail) { Spree::InquiryMailer.notification(inquiry) }

      it 'has inquiry type in the subject' do
        mail.subject.should =~ /Confessions/
      end

      it 'has the correct to address' do
        mail.to.should == ['admin@example.com']
      end

      it 'has the correct reply_to address' do
        mail.reply_to.should == ['lucas@example.com']
      end

      it 'renders the ip addr in the body' do
        mail.body.encoded.should match inquiry.http_remote_addr
      end

      it 'renders the user_agent in the body' do
        mail.body.encoded.should match inquiry.http_user_agent
      end

    end

    describe 'confirmation' do

      let(:mail) { Spree::InquiryMailer.confirmation(inquiry) }

      it 'has inquiry type in the subject' do
        mail.subject.should =~ /Confessions/
      end

      it 'has the correct to address' do
        mail.to.should == ['lucas@example.com']
      end

      it 'has the correct reply_to address' do
        mail.reply_to.should == ['admin@example.com']
      end

      it 'renders the receiver name in the body' do
        mail.body.encoded.should match 'George Lucas'
      end

    end

  end

end
