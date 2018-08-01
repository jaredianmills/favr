class UserFavorsController < ApplicationController
  # before_action :set_user

  def show
    @user = User.find_by(params[:id])
    id = @user.id
    @review = Review.find_by user_id: id
  end

  def create
    @user_favor = UserFavor.new(requester_id: params[:requester_id].to_i, requestee_id: User.find_by(email: session["email"]).id, favor_id: params[:favor_id].to_i)
    if @user_favor.save
      redirect_to user_path(User.find_by(email: session[:email])), :flash => { :notice => "iou!" }
    else
      redirect_to favor_path(params[:favor_id].to_i)
    end

  end

end