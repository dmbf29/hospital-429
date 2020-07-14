require 'csv'
require_relative '../models/room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @next_id = 1 # this is going to be assigned to the next room
    @rooms = []
    load_csv # if that file exists
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
    save_csv
  end

  def all
    @rooms
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is a HASH
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
    # update the next_id
    # @next_id = @rooms.any? ? @rooms.last.id + 1 : 1
    @next_id = @rooms.last.id + 1 if @rooms.any?
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'capacity']
      @rooms.each do |room|
        csv << [room.id, room.capacity]
      end
    end
  end
end







#
