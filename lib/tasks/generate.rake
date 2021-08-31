namespace :generate do
  desc "Generate and load keys into database"
  task keys: :environment do
    
    MAX_LENGTH = 8

    # NOTE : The idea here is to generate all possible unique keys in our tokens table before 
    # our service is ready for public and the reason is to give faster/better experience for users 
    # its good to move the generation of keys into a service. 
    # I am only trying to create 5K keys for this exercise

    alphnum = [('a'..'z'), (0..9)].map(&:to_a).flatten
    5000.times do  
      string = (0...MAX_LENGTH).map { alphnum[rand(alphnum.length)] }.join
      Token.create({key: string})
    end

  end
end
