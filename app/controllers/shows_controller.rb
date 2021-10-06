class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show edit update destroy ]

  # GET /shows or /shows.json
  def index
    @shows = Show.order(:showtime).page(params[:page])
  end

  # GET /shows/1 or /shows/1.json
  def show
    @show = Show.find(params[:id])
    @venue = Venue.find(@show.venue_id)
  end

  def all_ages
    @shows = Show.all_ages.order(:showtime).page(params[:page])
  end

  # GET /shows/new
  def new
    @venue = Venue.find(params[:venue_id])
    @show = @venue.shows.new
    render :new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows or /shows.json
  def create
    @venue = Venue.find(params[:venue_id])
    @show = @venue.shows.new(show_params)

    respond_to do |format|
      if @show.save
        format.html { render :show, notice: "Show was successfully created." }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1 or /shows/1.json
  def update
    @show = Show.find(params[:id])
    if @show.update(show_params)
      flash[:notice] = "Show successfully updated!"
      redirect_to venue_path(@show.venue)
    else
      @venue = Venue.find(params[:venue_id])
      render :edit
    end
  end

  # DELETE /shows/1 or /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url, notice: "Show was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_show
    @show = Show.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def show_params
    params.require(:show).permit(:title, :artist1, :artist2, :artist3, :artist4, :showtime, :details, :price, :all_ages, :url, :venue_id)
  end

end
