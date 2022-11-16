class WithdrawsController < ApplicationController
  # GET /withdraws or /withdraws.json
  def index
    @withdraws = Withdraw.where(account: Account.find(params[:account_id]))
  end

  # GET /withdraws/1 or /withdraws/1.json
  def show
    @withdraw = Withdraw.find(params[:id])
  end

  # GET /withdraws/new
  def new
    @withdraw = Withdraw.new
  end

  # GET /withdraws/1/edit
  def edit
  end

  # POST /withdraws or /withdraws.json
  def create
    @withdraw = Withdraw.create(bank_id: Bank.find(Account.find(params[:account_id]).bank_id).id, account_id: params[:account_id], amount: params[:withdraw][:amount])
    @withdraw.fulfill_withdraw
    redirect_to user_account_path(session[:user_id], @withdraw.account_id)
  end

  # PATCH/PUT /withdraws/1 or /withdraws/1.json
  def update
  end

  # DELETE /withdraws/1 or /withdraws/1.json
  def destroy
  end
end
