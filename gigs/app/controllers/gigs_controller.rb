class GigsController < ApplicationController
  before_action :set_gig, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /gigs or /gigs.json
  def index
    @gigs = Gig.all
  end

  # GET /gigs/1 or /gigs/1.json
  def show
  end

  # GET /gigs/new
  def new
    # @gig = Gig.new
    @gig = current_user.gigs.build

  end

  # GET /gigs/1/edit
  def edit
  end

  # POST /gigs or /gigs.json
  def create
    # @gig = Gig.new(gig_params)
    @gig = current_user.gigs.build(gig_params)

    respond_to do |format|
      if @gig.save
        format.html { redirect_to @gig, notice: "Gig was successfully created." }
        format.json { render :show, status: :created, location: @gig }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gigs/1 or /gigs/1.json
  def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: "Gig was successfully updated." }
        format.json { render :show, status: :ok, location: @gig }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gigs/1 or /gigs/1.json
  def destroy
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: "Gig was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @gig = current_user.gigs.find_by(id: params[:id])
    redirect_to gigs_path, notice: "Not Authorized to Edit This Gig" if @gig.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gig
      @gig = Gig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gig_params
      params.require(:gig).permit(:gig_name, :gig_date, :gig_cache, :gig_type, :user_id )
    end
end
