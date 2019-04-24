ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  def login_as(user)
    post login_url, params: { name: user.username, password: '123456', password_confirmation: '123456' }
  end

  def logout
    delete logout_url
  end

  def setup
    login_as FactoryBot.create(:user)
  end
end
