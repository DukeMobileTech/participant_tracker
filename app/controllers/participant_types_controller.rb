class ParticipantTypesController < ApplicationController
  before_action :set_participant_type, only: [:show, :edit, :update, :destroy, :export]

  # GET /participant_types
  # GET /participant_types.json
  def index
    @participant_types = ParticipantType.all
  end

  # GET /participant_types/1
  # GET /participant_types/1.json
  def show
  end

  # GET /participant_types/new
  def new
    @participant_type = ParticipantType.new
  end

  # GET /participant_types/1/edit
  def edit
  end

  # POST /participant_types
  # POST /participant_types.json
  def create
    @participant_type = ParticipantType.new(participant_type_params)

    respond_to do |format|
      if @participant_type.save
        format.html { redirect_to @participant_type, notice: 'Participant type was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /participant_types/1
  # PATCH/PUT /participant_types/1.json
  def update
    respond_to do |format|
      if @participant_type.update(participant_type_params)
        format.html { redirect_to @participant_type, notice: 'Participant type was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /participant_types/1
  # DELETE /participant_types/1.json
  def destroy
    @participant_type.destroy
    respond_to do |format|
      format.html { redirect_to participant_types_url }
    end
  end

  def export
    fname = "#{@participant_type.label}_#{DateTime.now.to_i}.csv"
    send_data @participant_type.export, 
      :type => 'text/csv; charset=iso-8859-1; header=present',
      :disposition => "attachment; filename=#{fname}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant_type
      @participant_type = ParticipantType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_type_params
      params.require(:participant_type).permit(:label)
    end
end
