
10.times do
User.create(name: Faker::Name.name,
    email:Faker::Internet.email, 
    password_digest:Faker::Internet.password(min_length: 8))
end 

3.times do
    Recipe.create(title:Faker::Food.dish,
        ingredients:Faker::Food.ingredient,
        time:Faker::Number.number(digits: 2),
        step_1:Faker::Food.description, 
        step_2:Faker::Food.description,
        step_3:Faker::Food.description, 
        user_id: 6, 
        url:Faker::Internet.url)
end 

3.times do
    Recipe.create(title:Faker::Food.dish,
        ingredients:Faker::Food.ingredient,
        time:Faker::Number.number(digits: 2),
        step_1:Faker::Food.description, 
        step_2:Faker::Food.description,
        step_3:Faker::Food.description, 
        user_id: 4, 
        url:Faker::Internet.url)
end 

4.times do
    Recipe.create(title:Faker::Food.dish,
        ingredients:Faker::Food.ingredient,
        time:Faker::Number.number(digits: 2),
        step_1:Faker::Food.description, 
        step_2:Faker::Food.description,
        step_3:Faker::Food.description, 
        user_id: 5, 
        url:Faker::Internet.url)
end 

8.times do 
        Recipe.create(title:Faker::Food.dish,
            ingredients:Faker::Food.ingredient,
            time:Faker::Number.number(digits: 2),
            step_1:Faker::Food.description, 
            step_2:Faker::Food.description,
            step_3:Faker::Food.description, 
            user_id: 1, 
            url:Faker::Internet.url)
    end 
