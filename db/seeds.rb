# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

mc_car = Company.create!(name: "MC Car", key: "mc_car")
admin = User.create!(email: "admin@staged.com", name: "Administrador", password: "123456", company: mc_car, role: :admin, confirmed_at: Time.now.utc)
customer = User.create!(email: "customer@staged.com", name: "José Silva", password: "123456", role: :customer, confirmed_at: Time.now.utc)
car = Car.create!(user: customer, brand: "Fiat", model: "Palio", plate: "ABC-1234", mileage: 48321, color: "Branco")

services = Service.create!([
  {
    name: "Troca de óleo",
    description: "Troca de óleo do motor",
    status: :done,
    company: mc_car,
    customer: customer,
    car: car,
  },
  {
    name: "Filtro do Óleo",
    description: "Troca do Filtro do Óleo",
    status: :in_progress,
    company: mc_car,
    customer: customer,
    car: car,
  },
  {
    name: "Limpeza do Sistema de Arrefecimento",
    description: "Consiste em realizar a limpeza do sistema de arrefecimento do veículo, removendo toda a sujeira e resíduos que possam estar obstruindo o sistema.",
    status: :pending,
    company: mc_car,
    customer: customer,
    car: car,
  },
  {
    name: "Ajuste do Teto Solar",
    description: "O teto solar necessita de uma lubrificação para que o mesmo possa abrir e fechar com mais facilidade e evitar danos ao seu mecanismo.",
    status: :canceled,
    company: mc_car,
    customer: customer,
    car: car,
  }
])
