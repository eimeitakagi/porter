class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :like_notes]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @notes = @user.notes
    @title = "マイポートフォリオ"
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    file = params[:user][:image]
    @user.set_image(file)
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  def like_notes
    @notes = @user.like_notes
    @title = "イイね！一覧"
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :language, :job)
    end

    def correct_user
      user = User.find(params[:id])
      if !current_user?(user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end
end
