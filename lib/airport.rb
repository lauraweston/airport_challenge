class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(weather)
    @planes = []
    @weather = weather
    #@capacity = DEFAULT_CAPACITY
  end

  def land_plane(plane)
    raise 'Plane cannot land in stormy weather!' if stormy?
    raise 'Plane cannot land - airport is full!' if planes.count == DEFAULT_CAPACITY
    plane.land
    planes << plane if plane.landed?
  end

  def take_off(plane)
    raise 'Plane cannot take off in stormy weather!' if stormy?
    raise 'The plane is not in the airport!' if !planes.include?(plane)
    plane.take_off
    planes.delete(plane)
  end

  private

  def stormy?
    @weather.current_weather == :stormy
  end
end