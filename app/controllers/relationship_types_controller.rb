class RelationshipTypesController < ApplicationController
  before_action :set_relationship_type, only: [:show, :edit, :update, :destroy]
  
  def index
    @relationship_types = RelationshipType.all
  end
  
  def show
  end
  
  def edit
  end
  
  def new
    @relationship_type = RelationshipType.new
  end
  
  def create
    @relationship_type = RelationshipType.new(relationship_type_params)
    respond_to do |format|
      if @relationship_type.save
        format.html { redirect_to @relationship_type, notice: 'Relationship type was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @relationship_type.update(relationship_type_params)
        format.html { redirect_to @relationship_type, notice: 'Relationship type was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @relationship_type.destroy
    respond_to do |format|
      format.html { redirect_to relationship_types_url }
    end
  end
 
  private
  def set_relationship_type
      @relationship_type = RelationshipType.find(params[:id])
    end

  def relationship_type_params
    params.require(:relationship_type).permit(:participant_type_owner_id, :participant_type_related_id, :label)
  end
  
end
