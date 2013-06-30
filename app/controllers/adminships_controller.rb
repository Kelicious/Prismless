class AdminshipsController < ApplicationController
  def create
    @adminship = Adminship.new(params[:adminship])
    authenticate_admin(@adminship)

    if @adminship.save
      flash[:success] = "Added admin!"
    else
      flash[:error] = @adminship.errors.full_messages.join("\n")
    end

    redirect_back_or @adminship.user
  end
end
