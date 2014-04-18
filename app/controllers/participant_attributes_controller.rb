class ParticipantAttributesController < ApplicationController
  before_action :set_participant_attribute, only: [:show, :edit, :update, :destroy]

  # GET /participant_attributes
  # GET /participant_attributes.json
  def index
    @participant_attributes = ParticipantAttribute.all
  end

  # GET /participant_attributes/1
  # GET /participant_attributes/1.json
  def show
  end

  # GET /participant_attributes/new
  def new
    @participant_attribute = ParticipantAttribute.new
  end

  # GET /participant_attributes/1/edit
  def edit
  end

  # POST /participant_attributes
  # POST /participant_attributes.json
  def create
    @participant_attribute = ParticipantAttribute.new(participant_attribute_params)

    respond_to do |format|
      if @participant_attribute.save
        format.html { redirect_to @participant_attribute, notice: 'Participant attribute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @participant_attribute }
      else
        format.html { render action: 'new' }
        format.json { render json: @participant_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participant_attributes/1
  # PATCH/PUT /participant_attributes/1.json
  def update
    respond_to do |format|
      if @participant_attribute.update(participant_attribute_params)
        format.html { redirect_to @participant_attribute, notice: 'Participant attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @participant_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participant_attributes/1
  # DELETE /participant_attributes/1.json
  def destroy
    @participant_attribute.destroy
    respond_to do |format|
      format.html { redirect_to participant_attributes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant_attribute
      @participant_attribute = ParticipantAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_attribute_params
      params.require(:participant_attribute).permit(:participant_id, :attribute_id, :value)
    end
end
