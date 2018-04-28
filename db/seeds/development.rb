# Ffaker : https://github.com/ffaker/ffaker/tree/master/lib/ffaker/data
# ----------------
# Common
# -----------------
today      =     Time.zone.now
created_at =     today
updated_at =     today

def n_out_of_m?(n,m)
  (1..m).to_a.sample <= n
end

# -----------------
# Users
# -----------------
# invitation_created_at = today - ((34..64).to_a.sample * 3600 * 24)
# invitation_accepted_at = invitation_created_at + ((1..48).to_a.sample * 3600)
User.create!(
  firstname:             'Etienne',
  lastname:              'WEIL',
  email:                 'weil.etienne@hotmail.fr',
  role:                   2,
  cell_phone_nr:          '06 23 04 30 52',
  address:                '18, rue de Cotte Paris 12e',
  # uid:                    105205260860063499768
)
18.times do |n|
  uid =                   (105205260860063499768 + n + 1).to_s
  firstname =              FFaker::NameFR.unique.first_name
  lastname =               FFaker::NameFR::unique.last_name
  email =                  FFaker::Internet.free_email
  role =                   (0..3).to_a.sample
  is_registered =          n_out_of_m?(8,11)
  cell_phone_nr =          nil
  address =                nil
  if is_registered
    cell_phone_nr =        FFaker::PhoneNumberFR::mobile_phone_number
    address =              FFaker::AddressFR::unique.full_address
    status =               3
  else
    status =              (0..3).to_a.sample
    status =              4 if status == 3
  end


  User.create!(
    email:                email,
    firstname:            firstname,
    lastname:             lastname,
    status:               status,
    # cell_phone_nr:        cell_phone_nr,
    # address:              address,
    # invitation_created_at: invitation_created_at,
    # invitation_accepted_at: invitation_accepted_at,
    role:                 role
  )
end
users = User.all

# Theaters
Theater.create!(
  theater_name:       'Kibelé',
  location:    '12, rue de l\'échiquier, 75010 PARIS',
  manager:              'Mr. Fraise',
  manager_phone:        '0148245774'
)
Theater.create!(
  theater_name:       'Centre Oudiné',
  location:    '16, rue Oudiné',
  manager:              'Mr. Battard',
  manager_phone:        '0121252142'
)
theaters = Theater.all
#
# # Events
#
# 25.times do |n|
#   name  = "Le #{FFaker::Name.name}"
#   event_date = today + (-200..200).to_a.sample * 3600 * 24
#   duration = Event::DURATIONS.sample[1]
#   note = FFaker::Lorem::paragraph(1)
#   Event.create!(
#     location:             locations.sample,
#     user:                 users.sample,
#     note:                 note,
#     duration:             duration,
#     event_date:           event_date,
#     created_at:           created_at,
#     updated_at:           updated_at
#   )
# end
# events = Event.all
#
# # Actors
#
# events.each do |event|
#   6.times do |n|
#     Actor.create(
#       event_id:       event.id,
#       user_id:        users.sample.id    ,
#       stage_role:     Actor::stage_roles.keys.sample.to_sym
#     )
#   end
# end
