class Room
  attr_reader :capacity, :patients
  class CapacityReachedError < Exception
  end

  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0 # integer
    @patients = attributes[:patients] || [] # an array of instances
  end

  def full?
    @capacity == @patients.length
  end

  def add_patient(patient)
    # big == self
    # inside of an instance method, self refers to the instance
    raise CapacityReachedError, "The room is full" if full?

    patient.room = self # instance of the room
    @patients << patient
  end
end
