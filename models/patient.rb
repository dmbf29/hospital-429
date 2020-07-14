class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name] # string
    #          for loading     || # default value
    @cured = attributes[:cured] || false
    @room = attributes[:room] # instance
    # attributes[:room_id] don't need this
  end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end
end

# p Patient.new(id: )

# p rob.cured?
# p rob.cure!
# p rob.cured?
