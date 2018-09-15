Given(/I am on the Home Page/) do
  @home_page = HomePage.new(@browser)
  @home_page.visit
end

Given(/I am on the Registration Page/) {@registration_page = RegistrationPage.new(@browser)}

Given(/I get my favorite album/) do
  @home_page = HomePage.new(@browser)
  @expected_album_title = @home_page.get_album_title
  @expected_album_subtitle = @home_page.get_album_subtitle
end


When(/I accept cookies and click registration/) do
  @home_page.accept_cookies
  @registration_button = @home_page.click_registration
end

When(/I fill email and password fields/) {@registration_page.register_user}

When(/Add album to favorites/) do
  @home_page.close_popup
  @home_page.add_album_to_favorites
end

When(/I navigate to favorites/) do
  @home_page.open_favorite_music
  @favorites_page = FavoriteMusicPage.new(@browser)
end


Then(/The Registration Page should be opened/) {!expect(@registration_button)}

Then(/User is being created/) {@registration_page.verify_user}

Then(/The icon should be highlighted/) {expect(@home_page.is_icon_highlighted)}

Then(/Verify that correct album is present/) do
  expect(@favorites_page.get_album_title).to eq(@expected_album_title)
  expect(@favorites_page.get_album_subtitle).to eq(@expected_album_subtitle)
end