class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Reviewed a movie!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
  end
  

  private

    def micropost_params
      params.require(:micropost).permit(:content, :title, :year, :month, :date, :theater, :rating)
    end
end
