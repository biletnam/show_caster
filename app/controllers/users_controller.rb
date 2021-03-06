class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    authorize User
    @users = policy_scope(User)
  end

  def create
    @user = User.new(user_params)
    authorize(@user)
    if @user.save
      redirect_to users_path,
                  notice: I18n.t('users.setup', full_name: @user.full_name)
    else
      render :new
    end
  end

  def new
    @user = User.new
    authorize(@user)
  end

  def edit
    target = @user.setup? ? 'edit' : 'complement'
    render target
  end

  def show; end

  def update
    phone_exists = user_params[:cell_phone_nr].blank?
    params[:user][:status] = 'registered' unless phone_exists
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: I18n.t('users.updated')
    else
      render :complement, notice: I18n.t('users.not_updated')
    end
  end

  def destroy; end

  def promote
    @user = User.find(params[:user][:id])
    return if @user.nil?

    @user.status = params[:user][:status]
    @user.role = params[:user][:role]
    if @user.save
      message = inform_promoted_person(@user)
      @user.reload
      redirect_to users_path, notice: I18n.t(message, name: @user.full_name)
    else
      flash[:alert] = I18n.t('users.promoted_failed', name: @user.full_name)
      render 'users/show'
    end
  end

  def invite
    @user = User.find(params[:user][:id])
    return if @user.nil?
    @user.status = 'invited'
    if @user.save
      @user.welcome_mail
      redirect_to user_path(@user),
                  notice: I18n.t('users.invited', name: @user.full_name)
    else
      flash[:alert] = I18n.t('users.invited_failed', name: @user.full_name)
      render 'users/show'
    end
  end

  def bio
    @user = User.find(params[:user][:id])
    return if @user.nil?
    @user.bio = params[:user][:bio]
    if @user.save
      redirect_to users_path, notice: I18n.t('users.bio_successfull')
    else
      flash[:alert] = I18n.t('users.bio_failed', name: @user.full_name)
      render 'users/show'
    end
  end

  private

  def inform_promoted_person(user)
    role = user.role
    excl1 = current_user == user
    excl2 = role == 'player'
    user.promoted_mail unless excl1 || excl2
    role == 'player' ? 'users.promoted_muted' : 'users.promoted'
  end

  def set_user
    @user = User.find(params[:id])
    authorize(@user)
  end

  def user_params
    params
      .require(:user)
      .permit(
        :firstname,
        :lastname,
        :email,
        :address,
        :cell_phone_nr,
        :status,
        :bio
    )
  end
end
