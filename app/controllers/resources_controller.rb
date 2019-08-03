class ResourcesController < ApplicationController

  def index
    @resources = Resource.where(Resource.arel_table[:name].matches("%#{params[:search_term]}%"))
  end

  def new
    # TODO: make this a post action so that the root cannot be changed
    @root_resource_id = params[:root_resource_id]
    @resource = Resource.new
  end

  def show
    @resource = Resource.find(params[:id])
    @sections = @resource.sections
    @related_resources = @resource.related_resources
  end

  def create
    # TODO: break out similar resource into it's own controller
    if params[:root_resource_id].present?
      resource = Resource.find(params[:root_resource_id])
      related_resources = resource.related_resources
      # TODO: add check for if saving actually works, break out into service?
      created_resource = resource.similar_resources.create!(resource_params)
      related_resources.each do |related_resource|
        ResourceRelation.create!(resource_id: related_resource.id, resource_relation_id: created_resource.id)
      end
      redirect_to resource_path(created_resource)
    else
      resource = Resource.new(resource_params)
      if resource.save!
        redirect_to resource_path(resource)
      else
        render status: 500
      end
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:url, :language, :name)
  end

  def similar_resource_params
    params.require(:resource).permit(:url, :language, :name).merge(resource_relation_id: params[:root_resource_id])
  end
end
