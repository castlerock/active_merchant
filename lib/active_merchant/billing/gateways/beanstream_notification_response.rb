require File.dirname(__FILE__) + '/beanstream/beanstream_response_helper'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class BeanstreamNotificationResponseGateway < Gateway
      include BeanstreamResponseHelper
      def initialize(options = {}); end

      def beanstream_response(response)
       make_recurring_response_notification(response)
      end

      private
      def build_response(*args)
        Response.new(*args)
      end
    end
  end
end