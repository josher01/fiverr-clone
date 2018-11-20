namespace :dev do
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"] 
  task :rebuild => [ "dev:build","db:seed", :fake_user, :fake_category, :fake_service, :fake_package, :fake_favorite, :fake_review]
  
  task fake_user: :environment do   
    20.times do |i|
      name = FFaker::Name::first_name
      file = "https://randomuser.me//api//portraits//women//#{i}.jpg"
      user = User.create!(
        name: name,
        email: "#{name}@fiverr-clone.com",
        password: "12345678",
        description: FFaker::Lorem::sentence(20),
        avatar: file
      )
      puts user.name
    end
  end


  task fake_category: :environment do
    Category.destroy_all
    CAT_LIST = ["Graphic & Design", "Digital Marketing", "Music & Audio", "Programming & Tech", "Business", "Fun & Lifestyle", "Writing & Translation"]
    CAT_LIST.each do |cat|
      Category.create!(title: cat)
    end

    puts "Default Categories Created!"
  end

  task fake_service: :environment do
    Service.destroy_all
    30.times do |i|
      user = User.all.sample
      service = Service.create!(
        description: FFaker::Lorem::paragraph(sentence_count = 8),
        user_id: user.id,
        category: Category.all.sample,
        title: 'I will create '+ FFaker::Lorem::sentence(1),
        created_at: FFaker::Time::datetime
      )
    end
    puts "Total #{Service.count} services created !"
  end

  task fake_package: :environment do
    Package.destroy_all
    PACK_LIST = ['Standard', 'Silver', 'Golden']
    Service.all.each do |service|
      PACK_LIST.each_with_index do |pack, index|
        Package.create!(
          name: pack,
          service: service,
          description: FFaker::Lorem::sentence(5),
          is_commercial: [true,false].sample,
          delivery_time: rand(1..30),
          revision_number: rand(1..9),
          created_at: FFaker::Time::datetime,
          price: ((index+1)*100) + (rand(1..5)*50)
          )
      end
    end
    puts "Total #{Package.count} packages created !"
  end

  task fake_favorite: :environment do
    Favorite.destroy_all
      50.times do |i|
        user = User.all.sample
        service = Service.all.sample
        favorite = Favorite.create!(
          service: service,
          user: user,
          created_at: FFaker::Time::datetime
        )
      end
    puts "Total #{Favorite.count} favorites created !"
  end

  task fake_review: :environment do
    Review.destroy_all
    Service.all.each do |service|
      5.times do |i|
        Review.create!(
          service: service,
          user: User.all.sample,
          star: rand(1..5),
          comment: FFaker::Lorem::sentence(5)
          )
      end
    end
    puts "Total #{Review.count} reviews created !"
  end

  
  task fake_all: :environment do
    Rake::Task["db:migrate"].execute
    Rake::Task["db:seed"].execute
    Rake::Task["dev:fake_user"].execute
    Rake::Task["dev:fake_category"].execute
    Rake::Task["dev:fake_service"].execute
    Rake::Task["dev:fake_package"].execute
    Rake::Task["dev:fake_favorite"].execute
    Rake::Task["dev:fake_review"].execute
  end
end