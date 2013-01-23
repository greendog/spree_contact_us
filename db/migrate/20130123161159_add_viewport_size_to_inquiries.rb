class AddViewportSizeToInquiries < ActiveRecord::Migration
  def change
    add_column :spree_inquiries, :client_viewport_size, :string, :length => 15
  end
end
