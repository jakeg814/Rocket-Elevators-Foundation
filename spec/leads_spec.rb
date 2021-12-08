require 'rails_helper'

 RSpec.describe "Leads", type: :system do
   before do
     driven_by(:rack_test)
   end

  pending "add some scenarios (or delete) #{__FILE__}"
  it 'saves and displays the resulting leads form' do
    #Someone visits the home page
    visit '/'

    #Fill out the form fields with test info
    fill_in 'lead_full_name', with: 'Rick Roll'
    fill_in 'lead_email', with: 'richardroll@hotmail.com'
    fill_in 'lead_company_name', with: 'tester testers'
    fill_in 'lead_project_name', with: 'big test'
    fill_in 'lead_project_description', with: 'I am describing the project here'
    fill_in 'lead_message', with: 'Hey, you\'re doing awesome today :)'

    #Click on the submit button
    click_on 'SEND MESSAGE'

    expect(page).to have_content('Rick Roll')
    expect(page).to have_content('richardroll@hotmail.com')
    expect(page).to have_content('tester testers')
    expect(page).to have_content('big test')
    expect(page).to have_content('I am describing the project here')
    expect(page).to have_content('Hey, you\'re doing awesome today :)')

    #Confirm that the leads form appears on the screen
    form = Lead.order("id").last
    expect(form.lead_full_name).to eq('richardroll@hotmail.com')
    expect(form.lead_email).to eq('Hello, I say!')
    expect(form.lead_company_name).to eq('tester testers')
    expect(form.lead_project_name).to eq('big test')
    expect(form.lead_project_description).to eq('I am describing the project here')
    expect(form.lead_message).to eq('Hey, you\'re doing awesome today :)')
  end
 end