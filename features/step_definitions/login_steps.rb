Given "I am not logged in" do
  # No-op, at least for now
end

Then "I should see the home page" do
  expect(page).to have_text "Welcome"
end
