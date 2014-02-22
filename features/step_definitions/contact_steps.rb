When "I go to the contact page" do
  visit "/"
  click_link "Contact"
end

Then "I should see the contact details" do
  expect(page).to have_text "Community contacts"
end
