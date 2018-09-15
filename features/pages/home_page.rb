class HomePage

  attr_accessor :accept_cookies_button, :registration_button, :popup_close_button, :first_cover, :favorite_icon,
                :favorite_icon_active, :favorite_nav_bar, :album_title, :album_subtitle

  URL = 'http://juke.com/'

  def initialize(browser)
    @browser = browser
    @accept_cookies_button = @browser.element(:class => 'icon-holder')
    @registration_button = @browser.element(:xpath => "//a[.='Registrieren']")
    @popup_close_button = @browser.element(:xpath => "//a[contains(@class, 'trial-popup__close')]")
    @first_cover = @browser.element(:xpath => "//header[.//.='Neuheiten']/following-sibling::*//div[@class='cover-holder'][1]")
    @favorite_icon = @browser.element(:xpath => "//a[contains(@class, 'icon-holder-favorite')]")
    @favorite_icon_active = @browser.element(:xpath => "//a[contains(@class, 'icon-holder-favorite') and contains(@class, 'icon-holder-active')]")
    @favorite_nav_bar = @browser.element(:xpath => "//a[.='Meine Musik']")
    @album_title = @first_cover.element(xpath: ".//a[contains(@class, 'juke-cover__title ellipsis')]")
    @album_subtitle = @first_cover.element(xpath: ".//a[@class='juke-cover__subtitle ellipsis']")
  end

  def visit
    @browser.goto URL
  end

  def click_registration
    self.registration_button.click
    self.registration_button.present?
  end

  def accept_cookies
    self.accept_cookies_button.click
  end

  def close_popup
    self.popup_close_button.wait_until_present
    self.popup_close_button.click
  end

  def add_album_to_favorites
    @browser.scroll.to :bottom
    self.first_cover.wait_until_present
    self.first_cover.scroll.to
    self.first_cover.hover
    self.favorite_icon.click
  end

  def is_icon_highlighted
    self.favorite_icon_active.present?
  end

  def open_favorite_music
    self.favorite_nav_bar.click
  end

  def get_album_title
    self.album_title.text
  end

  def get_album_subtitle
    self.album_subtitle.text
  end

end