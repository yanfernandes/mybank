class TransfersController < ApplicationController
  # GET /transfers or /transfers.json
  def index
    @transfers = Transfer.where("sender_id = ? or receiver_id = ?", params[:account_id], params[:account_id])
  end

  # GET /transfers/1 or /transfers/1.json
  def show
    @transfer = Transfer.find(params[:id])
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new
    @recipients = Transfer.get_recipients(params[:account_id])
    @recipient_names = Transfer.get_recipient_names(params[:account_id])
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers or /transfers.json
  def create
    @transfer = Transfer.create(sender_id: params[:account_id], receiver_id: params[:transfer][:receiver_id], amount: params[:transfer][:amount])
    @transfer.start_transfer(@transfer.amount)
    @transfer.save
    redirect_to user_account_path(session[:user_id], @transfer.sender)
  end

  # PATCH/PUT /transfers/1 or /transfers/1.json
  def update
  end

  # DELETE /transfers/1 or /transfers/1.json
  def destroy
  end

  private

  def transfer_params
    params.require(:transfer).permit(:sender, :receiver, :amount)
  end
end
