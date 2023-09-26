# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

[
  Company,
  User,
  Car,
  Services::Service,
  Services::Step,
].each(&:delete_all)

mc_car = Company.create!(name: "MC Car", key: "mc_car")
admin = User.create!(email: "admin@staged.com", name: "Administrador", password: "123456", company: mc_car, role: :admin, confirmed_at: Time.now.utc)

customers = []
30.times do |i|
  customers << User.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    password: "123456",
    role: :customer,
    confirmed_at: Time.now.utc
  )
end
User.import!(customers)

customer = User.create!(email: "customer@staged.com", name: "José Silva", password: "123456", role: :customer, confirmed_at: Time.now.utc)
car = Car.create!(user: customer, brand: "Fiat", model: "Palio", plate: "ABC-1234", mileage: 48321, color: "Branco", year_make: 2008, year_model: 2009)

regular_maintenance = Services::Service.create!({
  name: "Revisão de 50.000km",
  description: "Revisão de 50.000km do veículo",
  status: :in_progress,
  car: car,
})

Services::Service.create!({
    name: "Descarbonização",
    description: "A descarbonização consiste em limpar o motor do carro, removendo a fuligem e a carbonização que se acumulam no motor, causando problemas como falhas na ignição, aumento do consumo de combustível e perda de potência.",
    status: :canceled,
    car: car,
})

Services::Step.create!([
  {
    name: "Troca de óleo",
    description: "Troca de óleo do motor",
    status: :done,
    service: regular_maintenance,
  },
  {
    name: "Filtro do Óleo",
    description: "Troca do Filtro do Óleo",
    status: :in_progress,
    service: regular_maintenance,
  },
  {
    name: "Limpeza do Sistema de Arrefecimento",
    description: "Consiste em realizar a limpeza do sistema de arrefecimento do veículo, removendo toda a sujeira e resíduos que possam estar obstruindo o sistema.",
    status: :pending,
    service: regular_maintenance,
  },
])
