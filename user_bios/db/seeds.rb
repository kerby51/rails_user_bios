20.times do
  User.create({
    name: FFaker::Name.name,
    address: FFaker::Address.street_address,
    city: FFaker::Address.city,
    email: FFaker::Internet.email
  })
end

100.times do
  Story.create({
    content: FFaker::HipsterIpsum.paragraph,
    user_id: Random.new.rand(1..20)
  })
end
