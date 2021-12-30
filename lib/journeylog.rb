class JourneyLog
  attr_reader :journeys

  def initialize(journey_class: )
    @journeys = []
    @journey_class = journey_class
  end

  def start(entry_station)
     @current_journey = @journey_class.new(entry_station)
  end

  private 

  def current_journey
    @current_journey ||= @journey_class.new
  end
end


# the code is initialized by passing in the Journey
# class. It is not instantiated until the journey
# starts. #start instantiates the journey class
# and passes in an entry station.

# Journey class can be instantiated without 
# passing in an entry station. It can be nil