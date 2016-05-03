class MemesController < ApplicationController
  before_action :authenticate_dank_user!, except: [:index, :show]
  before_action :set_meme, only: [:show, :edit, :update, :destroy]


  # GET /memes
  # GET /memes.json
  def index
    @memes = Meme.all
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
  end

  # GET /memes/new
  def new
    @meme = Meme.new
  end

  # GET /memes/1/edit
  def edit
  end

  # POST /memes
  # POST /memes.json
  def create
    @meme = current_dank_user.memes.new(meme_params)
    @meme.rating = 0

    respond_to do |format|
      if @meme.save
        format.html { redirect_to @meme, notice: 'Meme was successfully created.' }
        format.json { render :show, status: :created, location: @meme }
      else
        format.html { render :new }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memes/1
  # PATCH/PUT /memes/1.json
  def update
    respond_to do |format|
      if @meme.update(meme_params)
        format.html { redirect_to @meme, notice: 'Meme was successfully updated.' }
        format.json { render :show, status: :ok, location: @meme }
      else
        format.html { render :edit }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memes/1
  # DELETE /memes/1.json
  def destroy
    @meme.destroy
    respond_to do |format|
      format.html { redirect_to memes_url, notice: 'Meme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @meme = Meme.find(params[:id])
    current_dank_user.vote_exclusively_for(@meme)
    @meme.rating = @meme.votes_for
    @meme.save
    redirect_to(:back)
  end

  def downvote
    @meme = Meme.find(params[:id])
    current_dank_user.vote_exclusively_against(@meme)
    @meme.rating = @meme.votes_for
    @meme.save
    redirect_to(:back)
  end

  def topmemes
    @memes = Meme.order(rating: :desc)
  end

  def newmemes
    @memes = Meme.order(updated_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meme
      @meme = Meme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meme_params
      params.require(:meme).permit(:meme_type, :top_text, :bottom_text, :rating)
    end
end
