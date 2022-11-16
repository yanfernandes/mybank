class DepositsController < ApplicationController
  # GET /deposits or /deposits.json
  def index
    @deposits = Deposit.all
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
  end

  # PATCH/PUT /deposits/1 or /deposits/1.json
  def update
  end

  # DELETE /deposits/1 or /deposits/1.json
  def destroy
  end
end
