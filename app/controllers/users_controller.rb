class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  # GET /users or /users.json
def index
  @users = User.all
  respond_to do |format|
    format.html # index.html.erb
    format.xml { render xml: @users }
    format.json { render json: @users }
  end
end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render xml: @user }
    end
  end

  # GET /users/new
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render xml: @user }
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "Usuário criado com sucesso." }
        format.json { render :show, status: :created, location: @user }
        format.xml { render xml: @user, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Usuário atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @user }
        format.xml { head :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "Usuário deletado com sucesso." }
      format.json { head :no_content }
      format.xml { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:login, :password, :name, :email)
    end
end
