require 'sqlite3'

class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy, :delete]

  # GET /songs
  # GET /songs.json
  def index

    @songs = Song.all

    if params['title'].present?
      if params['bookcode'].present?
        @songs = @songs.filter_book_songs params['title'], params['bookcode']
      else
        @songs = @songs.filter_songs params['title']
      end
    elsif params['bookcode'].present?
      @songs = @songs.where bookcode: params['bookcode']
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update

    respond_to do |format|
      if @song.update_song(song_params['title'], song_params['bookcode'], song_params['page'])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    if song_params[:id].blank?
      @song.delete_songs(song_params['title'], song_params['bookcode'], song_params['page'])
    else
      @song = Song.find(song_params[:id])
      @song.delete_song
    end
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:bookcode, :page, :title, :id)
    end
end
