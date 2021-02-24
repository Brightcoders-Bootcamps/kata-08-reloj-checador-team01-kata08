module RequestSpecHelper
  #   include Warden::Test::Helpers

  #   def self.included(base)
  #     base.before(:each) { Warden.test_mode! }
  #     base.after(:each) { Warden.test_reset! }
  #   end

  #   def sign_in(resource)
  #     login_as(resource, scope: warden_scope(resource))
  #   end

  #   def sign_out(resource)
  #     logout(warden_scope(resource))
  #   end

  #   private

  #   def warden_scope(resource)
  #     resource.class.name.underscore.to_sym
  #   end

  def login_admin
    # Before each test, create and login the admin
    p "Entre aqui 1"
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:admin)
      p "admin #{admin.to_json}"
      # admin.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in admin
    end
  end
end
