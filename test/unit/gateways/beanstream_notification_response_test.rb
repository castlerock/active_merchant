require File.dirname(__FILE__) + '/../../test_helper'

class BeanstreamNotificationResponseTest < Test::Unit::TestCase
  def setup
    @response_init = BeanstreamNotificationResponseGateway.new
    @params_hash = HashWithIndifferentAccess.new({
        "billingIncrement"=>"1", "authCode"=>"TEST", "ref1"=>"", "billingId"=>"3991157",
        "trnId"=>"10000231", "messageId"=>"1", "periodFrom"=>"7/19/2010", "ref2"=>"",
        "orderNumber"=>"SOL30days1279290905", "accountName"=>"xiaobo zzz",
        "ref3"=>"", "ref4"=>"", "emailAddress"=>"nkumar@crri.co.in", "ref5"=>"",
        "billingPeriod"=>"D", "trnApproved"=>"1", "messageText"=>"Approved",
        "billingDate"=>"7/19/2010", "billingAmount"=>"20.00", "periodTo"=>"7/19/2010"
      })
  end

  def test_beanstream_response
    assert @response_init.beanstream_response(@params_hash).is_a?(Response)
    assert @response_init.test?
    assert @response_init.success?(@params_hash)
  end
end