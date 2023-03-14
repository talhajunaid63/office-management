class ClientsController < ApplicationController
  before_action :set_current_company
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)
    @client.company = @company

    respond_to do |format|
      if @client.save
        format.html { redirect_to company_clients_url(@company), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('remote_modal_body',
                                                   partial: 'clients/form',
                                                   locals: { client: @client })
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to company_clients_url(@company), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('remote_modal_body',
                                                   partial: 'clients/form',
                                                   locals: { client: @client })
        end
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_current_company
      @company = Company.find(params[:company_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :email, :phone_number, :website, :github_url, :company_id)
    end
end
