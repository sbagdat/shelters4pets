Shelter.destroy_all

shelter1 = Shelter.create!(name: "Shelter One", city: "Eskisehir", rank: 10)
shelter2 = Shelter.create!(name: "Shelter Two", city: "Istanbul", rank: 5)
shelter3 = Shelter.create!(name: "Shelter Three", city: "Ankara", rank: 7)

shelter1.pets.create(name: "Cico", breed: "Asian", age: 12)
shelter2.pets.create(name: "Kiki", breed: "American", age: 2)
