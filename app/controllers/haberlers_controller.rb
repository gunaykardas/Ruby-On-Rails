class HaberlersController < ApplicationController
 # before_action :set_haberler, only: [:show, :edit, :update, :destroy]
    before_action :set_haberler, only: [:show, :edit, :update, :destroy, :kontrol]
    before_action :authenticate_admin_user!, except: [:index, :show]
    before_action :kontrol, only: [:edit, :update, :destroy]

  # GET /haberlers
  # GET /haberlers.json
  def index
    @haberlers = Haberler.all
  end

  # GET /haberlers/1
  # GET /haberlers/1.json
  def show
      @comments = Comment.where(haberler_id: @haberler).order("created_at DESC")
  end

  # GET /haberlers/new
  def new
    @haberler = Haberler.new
  end

  # GET /haberlers/1/edit
  def edit
  end

  # POST /haberlers
  # POST /haberlers.json
  def create
    @haberler = Haberler.new(haberler_params)
      

    respond_to do |format|
      if @haberler.save
        format.html { redirect_to @haberler, notice: 'Haberler was successfully created.' }
        format.json { render :show, status: :created, location: @haberler }
      else
        format.html { render :new }
        format.json { render json: @haberler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /haberlers/1
  # PATCH/PUT /haberlers/1.json
  def update
    respond_to do |format|
      if @haberler.update(haberler_params)
        format.html { redirect_to @haberler, notice: 'Haberler was successfully updated.' }
        format.json { render :show, status: :ok, location: @haberler }
      else
        format.html { render :edit }
        format.json { render json: @haberler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /haberlers/1
  # DELETE /haberlers/1.json
  def destroy
    @haberler.destroy
    respond_to do |format|
      format.html { redirect_to haberlers_url, notice: 'Haberler was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def kontrol
        if  !current_admin_user
            redirect_to root_url, notice: 'Yetkiniz yok'
        end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_haberler
      @haberler = Haberler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def haberler_params
      params.require(:haberler).permit(:baslik, :icerik, :resim)
    end
end
