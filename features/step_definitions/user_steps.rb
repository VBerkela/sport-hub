When('I create the following user:') do |table|
  attributes = table.rows_hash

  visit new_user_registration_path

  fill_in 'Email', with: attributes['Email']
  fill_in 'Full name', with: attributes['Full name']
  fill_in 'Password', with: attributes['Password']
  fill_in 'Password confirmation', with: attributes['Password confirmation']
  click_on 'Sign up'
end

Then('I should have the following user:') do |table|
  table.diff!(User.all.map(&:attributes))
end
