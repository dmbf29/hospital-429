require_relative 'models/patient'
require_relative 'models/room'
require_relative 'repositories/patient_repository'
require_relative 'repositories/room_repository'

# rob = Patient.new(name: 'Rob')
# yoshiki = Patient.new(
#   name: 'Yoshiki',
#   cured: true
# )
# veronica = Patient.new(name: 'Veronica')


room_repo = RoomRepository.new('data/rooms.csv')
patient_repo = PatientRepository.new('data/patients.csv', room_repo)

# patient_repo.add(rob)
# patient_repo.add(yoshiki)
# patient_repo.add(veronica)
p patient_repo

patrick = Patient.new(name: 'Patrick')
patient_repo.add(patrick)
puts

p patient_repo

# p patient_repo


# vip = Room.new(capacity: 2)
# # p big = Room.new(capacity: 10)
# vip.add_patient(rob)
# vip.add_patient(yoshiki)
# p vip.patients

# p rob.room

# # vip.add_patient(veronica)
# p vip

# vip = Room.new(capacity: 2)
# big = Room.new(capacity: 10)
# rob = Patient.new(name: 'Rob')
# yoshiki = Patient.new(name: 'Yoshiki')
# vip.add_patient(rob)
# big.add_patient(yoshiki)
