class ParticipantPropertiesController < ApplicationController
  before_action :set_participant_property, only: [:show, :edit, :update, :destroy]

  def index
    @participant = current_project.participants.find(params[:participant_id])
    @participant_properties = @participant.participant_properties
  end

  def show; end

  def new
    @participant = current_project.participants.find(params[:participant_id])
    @participant_property = @participant.participant_properties.new
  end

  def edit; end

  def create
    participant = current_project.participants.find(params[:participant_id])
    @participant_property = participant.participant_properties.new(participant_property_params)

    respond_to do |format|
      if @participant_property.save
        format.html { redirect_to project_participant_participant_properties_path(current_project, @participant), notice: 'Participant property was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @participant_property.update(participant_property_params)
        format.html { redirect_to project_participant_participant_properties_path(current_project, @participant), notice: 'Participant property was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @participant_property.destroy
    respond_to do |format|
      format.html { redirect_to project_participant_participant_properties_path(current_project, @participant) }
    end
  end

  private

  def set_participant_property
    @participant = current_project.participants.find(params[:participant_id])
    @participant_property = @participant.participant_properties.find(params[:id])
  end

  def participant_property_params
    params.require(:participant_property).permit(:property_id, :value, :uuid, :participant_uuid)
  end
end
