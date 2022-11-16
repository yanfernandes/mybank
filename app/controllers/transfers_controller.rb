class TransfersController < ApplicationController
  # GET /transfers or /transfers.json
  def index
    @transfers = Transfer.all
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
    @transfer = Transfer.create(transfer_params)
    redirect_to accounts_path(@transfer.sender)
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
