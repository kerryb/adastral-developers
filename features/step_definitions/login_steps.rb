Given "I am not logged in" do
  # No-op, at least for now
end

When %r{I (?:log|am logged|have logged) in} do
  unless page.current_path == login_path
    visit "/"
    click_link "Log in"
  end
  fill_in "EIN", with: "801234567"
  fill_in "IUSER password", with: "secret"
  click_button "Log in"
end

When "I log out" do
  click_link "Log out"
end

Then "I should see the home page" do
  expect(page).to have_text "Welcome"
end

Then "I should see my name in the navbar" do
  within "nav.top-bar" do
    expect(page).to have_text "Fred Bloggs"
  end
end

Then "I should not see my name in the navbar" do
  within "nav.top-bar" do
    expect(page).not_to have_text "Fred Bloggs"
  end
end

Then "I should have to log in" do
  expect(page.current_path).to eq login_path
  expect(page).to have_text "Please log in to see that page"
end
