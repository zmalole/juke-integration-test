class RegistrationPage

  attr_accessor :random_email, :email_input, :password_input, :registration_terms, :registration_button, :user_profile

  def initialize(browser)
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    @random_email = (0...50).map { o[rand(o.length)] }.join + '@gmail.com'

    @browser = browser
    @email_input = @browser.element(:id => 'registration-email')
    @password_input = @browser.element(:id => 'registration-password')
    @registration_terms = @browser.element(:id => 'registration-terms')
    @registration_button = @browser.element(:xpath => "//button[.='Registrieren']")
    @user_profile = @browser.element(:xpath => "//span[contains(@class, 'user-box__name') and .='#{@random_email}']")
  end

  def register_user
    self.email_input.send_keys(@random_email)
    self.password_input.send_keys('test-Password')
    self.registration_terms.click
    self.registration_button.click
  end

  def verify_user
    self.user_profile.wait_until_present
  end

end