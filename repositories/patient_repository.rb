require 'csv'
require_relative '../models/patient'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @next_id = 1 # this is going to be assigned to the next patient
    @patients = []
    load_csv # if that file exists
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_csv
  end

  def all
    @patients
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is a HASH
      row[:cured] = row[:cured] == 'true' # update
      row[:id] = row[:id].to_i # update
      # we have an id of a room
      # we need to find an instance with that id
      row[:room] = @room_repository.find(row[:room_id].to_i) # returns an instance
      @patients << Patient.new(row)
    end
    # update the next_id
    # @next_id = @patients.any? ? @patients.last.id + 1 : 1
    @next_id = @patients.last.id + 1 if @patients.any?
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'cured', 'room_id']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?, patient.room.id]
      end
    end
  end
end







#
