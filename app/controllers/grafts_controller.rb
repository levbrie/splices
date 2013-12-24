class GraftsController < ApplicationController
  def create
  	@user = current_user
  	@application = @user.applications.first || nil
  	@component = Component.find(name: params[:component])

  	respond_to do |format|
      if @application
      	AppGrafter.new(@application, @component)
        format.html { redirect_to :back, notice: "#{component.name} is being grafte onto your application." }
      else
        format.html { redirect_to :back, notice: "You do not seem to have any applications associated with this account." }
      end
    end
  end
end
