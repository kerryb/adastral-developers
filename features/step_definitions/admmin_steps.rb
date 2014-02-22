And "I am an admin" do
  User.where(uid: "fred").update_all admin: true
end

And "I am not an admin" do
  # No-op
end

Then "I should be able to access the admin site" do
  visit "/"
  click_link "Admin"
  expect(page).to have_text "Site Administration"
end

Then "I should not be able to access the admin site" do
  visit "/admin"
  expect(page.status_code).to eq 403
end

And "there should not be an admin link in the navbar" do
  within "nav.top-bar" do
    expect(page).not_to have_text "Admin"
  end
end
