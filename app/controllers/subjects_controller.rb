class SubjectsController < ApplicationController
  before_action :load_subject, only: %i(edit update destroy)

  def index
    @subjects = Subject.newest.paginate page: params[:page],
      per_page: Settings.per_page_default
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "messages.save_success"
      redirect_to subjects_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "messages.update_success"
      redirect_to subjects_path
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      render json: {msg: t("messages.destroy_success"), cls: "success"}
    else
      render json: {msg: t("messages.destroy_error"), cls: "danger"}
    end
  end

  private

  def subject_params
    params.require(:subject).permit :name, :description, :picture
  end

  def load_subject
    @subject = Subject.find_by id: params[:id]
    redirect_to subjects_path unless @subject
  end
end
