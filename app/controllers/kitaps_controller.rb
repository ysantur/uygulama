class KitapsController < ApplicationController
  before_action :set_kitap, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]       
  before_action :kontrol, only: [:edit, :update, :destroy]
  # GET /kitaps
  # GET /kitaps.json
  def index
    @kitaps = Kitap.all
  end

  # GET /kitaps/1
  # GET /kitaps/1.json
  def show
  end

  # GET /kitaps/new
  def new
    @kitap = Kitap.new
  end

  # GET /kitaps/1/edit
  def edit
  end

  def like
      @like=Like.find_by(kitap:params[:kitap_id])
      @like.sayi=@like.sayi+1
      @like.save
      respond_to do |format|
          format.js {@like}
          format.json
      end
  end
  
  # POST /kitaps
  # POST /kitaps.json
  def create
    @kitap = Kitap.new(kitap_params)
    @kitap.user=current_user
    respond_to do |format|
      if @kitap.save
        Like.create(kitap: @kitap, sayi:0)
        format.html { redirect_to @kitap, notice: 'Kitap was successfully created.' }
        format.json { render :show, status: :created, location: @kitap }
      else
        format.html { render :new }
        format.json { render json: @kitap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kitaps/1
  # PATCH/PUT /kitaps/1.json
  def update
    respond_to do |format|
      if @kitap.update(kitap_params)
        format.html { redirect_to @kitap, notice: 'Kitap was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitap }
      else
        format.html { render :edit }
        format.json { render json: @kitap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kitaps/1
  # DELETE /kitaps/1.json
  def destroy
    @kitap.destroy
    respond_to do |format|
      format.html { redirect_to kitaps_url, notice: 'Kitap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitap
      @kitap = Kitap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kitap_params
      params.require(:kitap).permit(:isim, :ozet, :sayfa, :resim)
    end
    
    def kontrol
        if @kitap.user!=current_user
            redirect_to root_url, notice: 'Yetkiniz yok'
        end
    end
end
