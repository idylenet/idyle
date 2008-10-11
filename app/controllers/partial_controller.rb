class PartialController < ApplicationController

  def index
    render :partial => params[:partial] if File.exists? ('app/views/' + params[:partial])
  end
  
  def color_picker
    render :partial => 'page/color_picker'
  end

end
