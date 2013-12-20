require 'spec_helper'

describe PagesController, '#show' do

	REDIRECT_CODE = 302
  %w{<%= page_names.join(" ") %>}.each do |page|
    context 'on GET to /pages/#{page}' do
      before do
        get :show, id: page
      end

      it { should respond_with(REDIRECT_CODE) }
    end

    context 'on GET to /pages/#{page}' do
      before do
      	user = double('user')
      	request.env['warden'].stub :authenticate! => user
      	controller.stub :current_user => user
        get :show, id: page
      end

      it { should respond_with(:success) }
      it { should render_template(page) }
    end
  end
end