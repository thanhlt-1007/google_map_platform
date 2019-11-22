class MapsJavascriptApisController < ApplicationController
  helper_method :lat, :lng, :zoom

  def index
    @params = {
      key: ENV["GMP_API_KEY"],
      callback: "initMap",
      libraries: "visualization"
    }
    @src = "#{Settings.map_javascript.base_url}?#{@params.to_query}"

    locations = (1..10).inject([]) do |locations, i|
      lat_i = lat + rand * (1..3).to_a.sample * [-1, 1].sample
      lng_i = lng + rand * (1..3).to_a.sample * [-1, 1].sample
      locations << {lat: lat_i, lng: lng_i}
    end

    gon.lat = lat
    gon.lng = lng
    gon.zoom = zoom
    gon.locations = locations
  end

  private

  def lat
    @lat ||= (params[:lat].presence || Settings.map_javascript.lat).to_f
  end

  def lng
    @lng ||= (params[:lng].presence || Settings.map_javascript.lng).to_f
  end

  def zoom
    @zoom ||= (params[:zoom].presence || Settings.map_javascript.zoom).to_i
  end
end
