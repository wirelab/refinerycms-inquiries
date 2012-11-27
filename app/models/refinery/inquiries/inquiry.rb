require 'refinery/core/base_model'
require 'filters_spam'
require 'acts_as_indexed'

module Refinery
  module Inquiries
    class Inquiry < Refinery::Core::BaseModel

      filters_spam :message_field => :message,
                   :email_field => :email,
                   :author_field => :name,
                   :other_fields => [:phone],
                   :extra_spam_words => %w()

      validates :name, :presence => true
      validates :email, :format=> { :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
      validates :message, :presence => true

      acts_as_indexed :fields => [:name, :email, :message, :phone, :address, :postalcode, :city]

      default_scope :order => 'created_at DESC'

      attr_accessible :salutation, :name, :phone, :message, :email, :address, :postalcode, :city

      def self.latest(number = 7, include_spam = false)
        include_spam ? limit(number) : ham.limit(number)
      end

    end
  end
end
