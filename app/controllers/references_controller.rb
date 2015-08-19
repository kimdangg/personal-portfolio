class ReferencesController < ApplicationController
  def index
    @references = Reference.all
  end

  def new
    @reference = Reference.new
  end

  def create
    @reference = Reference.new(reference_params)
    if @reference.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private
  def reference_params
    params.require(:reference).permit(:name, :email)
  end
end