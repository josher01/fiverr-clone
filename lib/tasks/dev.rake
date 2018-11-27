namespace :dev do
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"] 
  task :rebuild => [ "dev:build","db:seed", :fake_user, :fake_category, :fake_service, :fake_package, :fake_favorite, :fake_order, :fake_order_items, :fake_seller_review, :fake_buyer_review]
  
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

  task fake_order: :environment do
    Order.destroy_all
    SHIPPING_STATUS = ["processing", "delivered", "order received"]
    PAYMENT_STATUS = ["paid", "unpaid"]
    60.times do |i|
      user = User.all.sample
      Order.create!(
        user_id: user.id,
        shipping_status: SHIPPING_STATUS.sample,
        payment_status: PAYMENT_STATUS.sample,
        username: user.name,
        sn: Time.now.to_i,
        address: FFaker::Address::street_address,
        phone: "09" + rand(1..8).to_s + rand(1..8).to_s + "38294" + rand(1..8).to_s,
        )
    end
    puts "Total #{Order.count} orders created !"
  end

  task fake_order_items: :environment do
    OrderItem.destroy_all
    3.times do |i|
      Package.all.each do |package|
        OrderItem.create!(
          package_id: package.id,
          order_id: Order.all.sample.id,
          price: package.price,
          quantity: 1
          )
      end
    end
    puts "Total #{OrderItem.count} orderitems created !"
  end

  task fake_seller_review: :environment do
    SellerReview.destroy_all
    Service.all.each do |service|
      6.times do |i|
        SellerReview.create!(
          service: service,
          seller_id: service.user_id,
          star: 5,
          comment: ["Thanks for the feedback! ", "Appreciated! ", "Sweet! "].sample + FFaker::Lorem::sentence(1)
          )
      end
    end
    puts "Total #{SellerReview.count} seller reviews created !"
  end

  task fake_buyer_review: :environment do
    BuyerReview.destroy_all
    Service.all.each do |service|
      packages = service.packages
      packages.each do |package|
        if package.buyers
          package.buyers.each do |buyer|
            BuyerReview.create!(
              service: service,
              buyer_id: buyer.id,
              star: rand(1..5),
              comment: FFaker::Lorem::sentence(2)
              )
          end
        end
      end
    end
    puts "Total #{BuyerReview.count} buyer reviews created !"
  end

  
  task fake_all: :environment do
    Rake::Task["db:migrate"].execute
    Rake::Task["db:seed"].execute
    Rake::Task["dev:fake_user"].execute
    Rake::Task["dev:fake_category"].execute
    Rake::Task["dev:fake_service"].execute
    Rake::Task["dev:fake_package"].execute
    Rake::Task["dev:fake_favorite"].execute
    Rake::Task["dev:fake_order"].execute
    Rake::Task["dev:fake_order_items"].execute
    Rake::Task["dev:fake_seller_review"].execute
    Rake::Task["dev:fake_buyer_review"].execute
  end
end