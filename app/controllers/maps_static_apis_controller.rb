class MapsStaticApisController < ApplicationController
  helper_method :center, :zoom, :width, :height, :formats, :format, :maptypes, :maptype

  def index
    @params = {
      key: ENV["GMP_API_KEY"],
      center: center,
      zoom: zoom,
      size: size,
      maptype: maptype
    }

    @src = "#{Settings.staticmap.base_url}?#{@params.to_query}"
  end

  private

  def center
    params[:center].presence || Settings.staticmap.center
  end

  def zoom
    params[:zoom].presence || Settings.staticmap.zoom
  end

  def width
    params[:width].presence || Settings.staticmap.width
  end

  def height
    params[:height].presence || Settings.staticmap.height
  end

  def size
    "#{width}x#{height}"
  end

  def formats
    Settings.staticmap.formats.map {|format| format.split(";")}
  end

  def format
    params[:format].presence || Settings.staticmap.format
  end

  def maptypes
    Settings.staticmap.maptypes.map {|format| format.split(";")}
  end

  def maptype
    params[:maptype].presence || Settings.staticmap.maptype
  end
end
