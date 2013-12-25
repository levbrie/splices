class GraftsController < ApplicationController
  def create
  	@user = current_user
  	@application = @user.applications.first || nil
  	@component = Component.find_by name: params[:component]

  	respond_to do |format|
      if @application
      	AppGrafter.new(@application, @component).create_graft
        format.html { redirect_to :back, notice: "The #{@component.name} component is being grafted onto your application." }
      else
        format.html { redirect_to :back, notice: "You do not seem to have any applications associated with this account." }
      end
    end
  end
end
