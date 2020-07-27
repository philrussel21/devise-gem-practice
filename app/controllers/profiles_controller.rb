class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new(user_id: current_user)
  end

  def create
    @profile = Profile.new(profile_params)
    #assigns the newly created profile to the user object profile column to complete the database record.
    current_user.profile = @profile
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:name, :location, :age)
  end

end
