require 'rails_helper'

 RSpec.describe "Leads", type: :system do
   before do
     driven_by(:rack_test)
   end

  # pending "somebody fills out the Contact Us form with their information and hits send. The file location is: #{__FILE__}"
  it 'sends the resulting leads form' do
    #Someone visits the home page
    visit '/'

    #Fill out the form fields with test info
    fill_in 'lead_full_name', with: 'Richard Roll'
    fill_in 'lead_email', with: 'richardroll@hotmail.com'
    fill_in 'lead_company_name', with: 'tester testers'
    fill_in 'lead_project_name', with: 'big test'
    fill_in 'lead_project_description', with: 'I am describing the project here'
    fill_in 'lead_message', with: 'Hey, you\'re doing awesome today :)'

    #Click on the submit button
    click_on 'SEND MESSAGE'

    expect(page).to have_content('Full Name *')
    expect(page).to have_content('E-mail Address *')
    expect(page).to have_content('Business Name *')
    expect(page).to have_content('Project Name *')
    expect(page).to have_content('Project Description *')
    expect(page).to have_content('Message *')

    #
    form = Lead.order("id").last
    expect(form.full_name).to_not be_nil
    expect(form.email).to_not be_nil
    expect(form.company_name).to_not be_nil
    expect(form.project_name).to_not be_nil
    expect(form.project_description).to_not be_nil
    expect(form.message).to_not be_nil
    #Confirm that the leads form appears on the screen
    # expect(form.full_name).to eq('Richard Roll')
    # expect(form.email).to eq('richardroll@hotmail.com')
    # expect(form.company_name).to eq('tester testers')
    # expect(form.project_name).to eq('big test')
    # expect(form.project_description).to eq('I am describing the project here')
    # expect(form.message).to eq('Hey, you\'re doing awesome today :)')
  end
 end