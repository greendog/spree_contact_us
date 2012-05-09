class RenameInquiryToNamespace < ActiveRecord::Migration
  def change
    rename_table :inquiries, :spree_inquiries
  end
end
