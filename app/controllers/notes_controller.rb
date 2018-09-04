class NotesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.all.order("date DESC")
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(notes_params)
 
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def update
    if @note.update(notes_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private
    def find_post
      @note = Note.find(params[:id])
    end

    def notes_params
      params.require(:note).permit(:author, :date, :body)
    end
end
