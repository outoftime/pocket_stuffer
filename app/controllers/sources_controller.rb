class SourcesController < ApplicationController
  before_filter :ensure_user

  def index
    @sources = current_user.sources
  end

  def create
    source = current_user.sources.heuristic_create!(params[:source][:locator])
    redirect_to sources_path
  end

  def destroy
    current_user.sources.find(params[:id]).destroy
    redirect_to sources_path
  end
end
