class UsersController < ApplicationController  

  # render new.rhtml
  def new
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_permalink(params[:id])
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.name = params[:user][:name] # why is this necessary?!
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end
