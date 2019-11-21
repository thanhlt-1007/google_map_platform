class MapsJavascriptApisController < ApplicationController
  helper_method :lat, :lng, :zoom

  def index
    @params = {
      key: ENV["GMP_API_KEY"],
      callback: "initMap"
    }
    @src = "#{Settings.map_javascript.base_url}?#{@params.to_query}"

    gon.lat = lat.to_i
    gon.lng = lng.to_i
    gon.zoom = zoom.to_i
  end

  private

  def lat
    params[:lat].presence || Settings.map_javascript.lat
  end

  def lng
    params[:lng].presence || Settings.map_javascript.lng
  end

  def zoom
    params[:zoom].presence || Settings.map_javascript.zoom
  end
end
