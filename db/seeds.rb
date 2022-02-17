City.delete_all
User.delete_all
Gossip.delete_all
JoinTableGossipsTag.delete_all
Tag.delete_all
PrivateMessage.delete_all
Comment.delete_all


############################################
# NUMBERS

nb_city = 10
nb_user = 10
nb_gossip = 20
nb_tag = 10
nb_jointablegossipstag = 60
nb_privatemessage = 60
nb_comment = 80


###########################################
# CITIES

nb_city.times do |i|
  City.create!(
    name: Faker::Address.city,
  )
end
  puts "#{nb_city} cities created!"

############################################
# USERS

nb_user.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 12..112),
    city_id: City.all.shuffle.last.id,
  )
end
puts "#{nb_user} users created!"


############################################
# GOSSIPS

nb_gossip.times do |i|
  user = User.all.shuffle.last
  x = rand(3..14)
  Gossip.create!(
    # title: Faker::Hipster.sentence(word_count: 2, supplemental: true),
    # title: Faker::String.random(length: 3..14),

    title: Faker::Lorem.characters(number: x, min_alpha: x),
    content: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    user_id: user.id,
  )
end

puts "#{nb_gossip} gossips cooked up!"


###########################################
# TAGS

nb_tag.times do |i|
  Tag.create!(
    title: Faker::Hipster.word,
  )
end

puts "#{nb_tag} tags created!"


###########################################
# JOIN_TABLE_GOSSIPS_TAG

nb_jointablegossipstag.times do |i|
  gossip = Gossip.all.shuffle.last
  tag = Tag.all.shuffle.last
  JoinTableGossipsTag.create!(
    gossip_id: gossip.id,
    tag_id: tag.id,
  )
end

puts "#{nb_jointablegossipstag} jointable entries created!"

###########################################
# PRIVATE_MESSAGES

nb_privatemessage.times do |i|
  recipient = User.all.shuffle.last
  sender = User.all.shuffle.last
  PrivateMessage.create!(
    content: Faker::Hipster.paragraph(sentence_count: 1, supplemental: true, random_sentences_to_add: 5),
    recipient_id: recipient.id,
    sender_id: sender.id,
  )
end

puts "#{nb_privatemessage} private messages sent!"

############################################
# USERS -- ANONYMOUS
User.create!(
    first_name: "Anonymous 👻",
    last_name: "Anonymous",
    description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    email: "anonymous@anonymous.anonymous",
    age: Faker::Number.within(range: 12..112),
    city_id: City.all.shuffle.last.id,
  )

puts "Anonymous user created!"

############################################
# USERS -- ANONYMOUS
nb_comment.times do |i|
  user = User.all.shuffle.last
  gossip = Gossip.all.shuffle.last
  Comment.create!(
    content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    user_id: user.id,  
    gossip_id: gossip.id,
  )
end

puts "Comments created!"


############################################



puts "Hooray! Seeding done 👌"