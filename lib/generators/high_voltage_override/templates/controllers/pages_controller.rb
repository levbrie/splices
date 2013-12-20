class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_filter :authenticate_user!
  layout :layout_for_page

  private

  def layout_for_page
    if user_signed_in?
      "application"
    else
      "authentication"
    end
  end
end