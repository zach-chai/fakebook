class BookcodesController < ApplicationController
  before_action :set_bookcode, only: [:show, :edit, :update, :destroy]

  # GET /bookcodes
  # GET /bookcodes.json
  def index
    @bookcodes = Bookcode.all
  end

  # GET /bookcodes/1
  # GET /bookcodes/1.json
  def show
  end

  # GET /bookcodes/new
  def new
    @bookcode = Bookcode.new
  end

  # GET /bookcodes/1/edit
  def edit
  end

  # POST /bookcodes
  # POST /bookcodes.json
  def create
    @bookcode = Bookcode.new(bookcode_params)

    respond_to do |format|
      if @bookcode.save
        format.html { redirect_to @bookcode, notice: 'Bookcode was successfully created.' }
        format.json { render :show, status: :created, location: @bookcode }
      else
        format.html { render :new }
        format.json { render json: @bookcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookcodes/1
  # PATCH/PUT /bookcodes/1.json
  def update
    respond_to do |format|
      if @bookcode.update(bookcode_params)
        format.html { redirect_to @bookcode, notice: 'Bookcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookcode }
      else
        format.html { render :edit }
        format.json { render json: @bookcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookcodes/1
  # DELETE /bookcodes/1.json
  def destroy
    @bookcode.destroy
    respond_to do |format|
      format.html { redirect_to bookcodes_url, notice: 'Bookcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookcode
      @bookcode = Bookcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookcode_params
      params.require(:bookcode).permit(:code, :title, :format, :filename, :page_offset)
    end
end
