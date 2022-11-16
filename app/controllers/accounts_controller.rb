class AccountsController < ApplicationController
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
    @account = Account.create(bank_id: params[:account][:bank_id], user_id: params[:user_id], balance: params[:account][:balance])
    redirect_to user_account_path(@account.user_id, @account.id)
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    @account.update(account_params)
    redirect_to user_account_path(@account.id)
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
  end

  private
  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:user, :bank_id)
  end
end
