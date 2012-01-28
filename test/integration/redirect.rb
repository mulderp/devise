

require 'test_helper'

class RedirectTest < ActionController::IntegrationTest
  test 'sign in with email should result in redirect' do
    create_user(:email => 'Foo@Bar.com')
    
    sign_in_as_user do
      fill_in 'email', :with => 'foo@bar.com'
    end
    
    assert warden.authenticated?(:user)

    assert_redirected_to 'users/dashboard'
  end
end
