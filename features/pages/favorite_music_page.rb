class FavoriteMusicPage

  attr_accessor :album_title, :album_subtitle

  def initialize(browser)
    @browser = browser
    @album_title = @browser.element(:xpath => "//a[@class='juke-cover__title ellipsis']")
    @album_subtitle = @browser.element(:xpath => "//a[@class='juke-cover__subtitle ellipsis']")
  end

  def get_album_title
    self.album_title.text
  end

  def get_album_subtitle
    self.album_subtitle.text
  end

end