class DepositsController < ApplicationController
  # GET /deposits or /deposits.json
  def index
    @deposits = Deposit.where(account: Account.find(params[:account_id]))
  end

  # GET /deposits/1 or /deposits/1.json
  def show
    @deposit = Deposit.find(params[:id])
  end

  # GET /deposits/new
  def new
    @deposit = Deposit.new
  end

  # GET /deposits/1/edit
  def edit
  end

  # POST /deposits or /deposits.json
  def create
    @deposit = Deposit.create(bank_id: Bank.find(Account.find(params[:account_id]).bank_id).id, account_id: params[:account_id], amount: params[:deposit][:amount])
    @deposit.fulfill_deposit
    redirect_to user_account_path(session[:user_id], @deposit.account_id)
  end

  # PATCH/PUT /deposits/1 or /deposits/1.json
  def update
  end

  # DELETE /deposits/1 or /deposits/1.json
  def destroy
  end
end
