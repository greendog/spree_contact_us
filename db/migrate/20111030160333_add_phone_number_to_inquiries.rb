class AddPhoneNumberToInquiries < ActiveRecord::Migration
  def self.up
    add_column :inquiries, :phone_number, :string
  end

  def self.down
    remove_column :inquiries, :phone_number
  end
end
