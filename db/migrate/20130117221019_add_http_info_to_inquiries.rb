class AddHttpInfoToInquiries < ActiveRecord::Migration
  def change
    add_column :spree_inquiries, :http_user_agent, :string
    add_column :spree_inquiries, :http_remote_addr, :string
  end
end
