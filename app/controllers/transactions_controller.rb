class TransactionsController < ApplicationController
  include TransactionsHelper
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /transactions or /transactions.json
  def index
    if params[:month].present?
      session[:selectedMonth] = params[:month]
      @pagy, @transactions = pagy(Transaction.where("date_trunc('month', created_at)=? AND user_id=?", params[:month]+"-01", current_user.id), items: 10)
    else
      session[:selectedMonth] = Time.now.strftime("%Y-%m")
      puts("no month", session[:selectedMonth])
      @pagy, @transactions = pagy(Transaction.where("date_trunc('month', created_at)=? AND user_id=?", session[:selectedMonth]+"-01", current_user.id), items: 10)
    end
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = current_user.transactions.build
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = current_user.transactions.build(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    #checks for the store by looking at the associated ids in the user
    @transaction = current_user.transactions.find_by(id: params[:id])
    redirect_to transactions_path, notice: "Not authorised" if @transaction.nil?
  end

  #chart paths



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:user_id, :store_id, :category_id, :amount)
    end
end
