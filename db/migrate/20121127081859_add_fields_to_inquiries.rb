class AddFieldsToInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :salutation, :string
    add_column :refinery_inquiries_inquiries, :address, :string
    add_column :refinery_inquiries_inquiries, :postalcode, :string
    add_column :refinery_inquiries_inquiries, :city, :string
  end
end
