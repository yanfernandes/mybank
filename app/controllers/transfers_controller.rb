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
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers or /transfers.json
  def create
  end

  # PATCH/PUT /transfers/1 or /transfers/1.json
  def update
  end

  # DELETE /transfers/1 or /transfers/1.json
  def destroy
  end
end
