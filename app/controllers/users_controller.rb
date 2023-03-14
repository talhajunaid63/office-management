class UsersController < ApplicationController
  before_action :set_company
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = @company.users
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.company = @company
    @user.password = SecureRandom.hex(10)

    respond_to do |format|
      if @user.save
        format.html { redirect_to company_users_url(@company), notice: 'User was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('remote_modal_body',
                                                   partial: 'users/form',
                                                   locals: { user: @user })
        end
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to company_users_url(@company), notice: 'User was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('remote_modal_body',
                                                   partial: 'users/form',
                                                   locals: { user: @user })
        end
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to company_users_url(@company), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = @company.users.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :job_position, :salary, :dob, :job_type, :email,
                                 :joining_date, :leaving_date)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
