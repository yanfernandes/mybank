class BanksController < ApplicationController
  before_action :set_bank, only: %i[ show edit update destroy ]

  # GET /banks or /banks.json
  def index
    @banks = Bank.all
  end

  # GET /banks/1 or /banks/1.json
  def show
    @bank = Bank.find(params[:id])
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks or /banks.json
  def create
    @bank = Bank.new(bank_params)
    if @bank.valid?
      @bank.save
      redirect_to bank_path(@bank)
    else 
      render :new
    end
  end

  # PATCH/PUT /banks/1 or /banks/1.json
  def update
    @bank.update(bank_params)
    redirect_to bank_path(@bank.id)
  end

  # DELETE /banks/1 or /banks/1.json
  def destroy
    @bank.destroy
    redirect_to banks_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def find_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit()
  end
end
