class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = current_project.participants.order('participant_type_id').page params[:page]
  end

  def show; end

  def new
    @participant = current_project.participants.new
  end

  def edit; end

  def create
    @participant = current_project.participants.new(participant_params)

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to project_participants_path(current_project) }
    end
  end

  private

  def set_participant
    @participant = current_project.participants.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:participant_type_id, :uuid)
  end
end
