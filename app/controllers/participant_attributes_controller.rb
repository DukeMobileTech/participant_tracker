class ParticipantAttributesController < ApplicationController
  before_action :set_participant_attribute, only: [:show, :edit, :update, :destroy]

  def index
    @participant = Participant.find(params[:participant_id])
    @participant_attributes = @participant.participant_attributes
  end

  def show
  end

  def new
    @participant = Participant.find(params[:participant_id])
    @participant_attribute = @participant.participant_attributes.new
  end

  def edit
  end

  def create
    @participant = Participant.find(params[:participant_id])
    @participant_attribute = @participant.participant_attributes.new(participant_attribute_params)

    respond_to do |format|
      if @participant_attribute.save
        format.html { redirect_to @participant_attribute, notice: 'Participant attribute was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @participant_attribute.update(participant_attribute_params)
        format.html { redirect_to @participant_attribute, notice: 'Participant attribute was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @participant_attribute.destroy
    respond_to do |format|
      format.html { redirect_to participant_attributes_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant_attribute
      @participant = Participant.find(params[:participant_id])
      @participant_attribute = @participant.participant_attributes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_attribute_params
      params.require(:participant_attribute).permit(:participant_id, :attribute_id, :value)
    end
end
