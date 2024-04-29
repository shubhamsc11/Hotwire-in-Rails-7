class UsersController < ApplicationController

  def index
    @users = User.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name])
    respond_to do |format|
      if @user.save
        @users = User.order(created_at: :desc)
        format.turbo_stream

        # if we don't want to use specific action turbo stream file. 
        # render turbo_stream: turbo_stream.append('users_list', partial: 'users/users_form', users: @users)
      else
        format.turbo_stream { render partial: 'error_form' }
        # render turbo_stream: turbo_stream.replace('users_list', partial: 'error_form')
      end
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def search
    search_query = params[:any][:search]
    if search_query.present?
      @users = User.where("name ILIKE ?", "%#{search_query}%")&.order(created_at: :desc)
      render turbo_stream: turbo_stream.replace('users_list', partial: 'searched_users', locals: { users: @users })

      # optimize way, and here you can enter inputs continouosly ->
      # render turbo_stream: turbo_stream.replace('users_list', partial: 'users/users_form', users: @users)
    else
      render turbo_stream: turbo_stream.replace('users_list', partial: 'error_form')
    end
  end

  def last_five_users
    @users = User.order(created_at: :desc).limit(5)
    render :last_five_users, status: :ok, locals: { users: @users, note: 'These are the last five users' }
  end

end
