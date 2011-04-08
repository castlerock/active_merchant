module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module BeanstreamResponseHelper

      CVD_CODES = {
        '1' => 'M',
        '2' => 'N',
        '3' => 'I',
        '4' => 'S',
        '5' => 'U',
        '6' => 'P'
      }

      AVS_CODES = {
        '0' => 'R',
        '5' => 'I',
        '9' => 'I'
      }

      def make_recurring_response_notification(response)
        build_response(success?(response), message_from(response), response,
                       :test => test? || response[:authCode] == "TEST",
                       :authorization => authorization_from(response),
                       :cvv_result => CVD_CODES[response[:cvdId]],
                       :avs_result => {:code => (AVS_CODES.include? response[:avsId]) ? AVS_CODES[response[:avsId]] : response[:avsId]}
        )
      end

      def authorization_from(response)
        "#{response[:trnId]};#{response[:trnAmount]};#{response[:trnType]}"
      end

      def message_from(response)
        response[:messageText]
      end

      def success?(response)
        response[:responseType] == 'R' || response[:trnApproved] == '1'
      end


    end
  end
end
