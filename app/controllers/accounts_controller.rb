class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @account = Account.find(params[:id])
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.create(account_params)
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    @account.update(account_params)
    redirect_to account_path(@account)
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
  end

  private
  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:user_id, :bank_id)
  end
end
