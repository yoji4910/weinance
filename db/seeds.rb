User.create!(
  name: "first",
  email: "first@example.com",
  height: 174.0,
  password: 'password',
  password_confirmation: 'password'
)

r = Random.new()

24.times do |n|
  name = Faker::Name.name
  email = "examples-#{n+1}@example.com"
  height = r.rand(150.0..185.0).round(1)
  password = 'password'
  User.create!(
    name: name,
    email: email,
    height: height,
    password: password,
    password_confirmation: password
  )
end

r2 = Random.new()
users= User.all

40.times do |n|
  weight = r2.rand(55.0..100.0)
  to = Time.zone.now
  from = to - 60.days

  users.each do |user|
    user.records.create!(
      weight: weight,
      created_at: r2.rand(from..to)
    )
  end
end