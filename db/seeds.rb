# coding: utf-8
user = User.new(name: 'マスターユーザー', email: 'hogehoge@hoge.com', password: 'hugahuga', password_confirmation: 'hugahuga', image: open("./app/assets/images/gal_o_man.png" ))
user.save!

new_user = User.last

Chara.create!(
  name: "化粧地雷子",
  image: open("./app/assets/images/kesyou_jirai_make.png"),
  user_id: new_user.id,
 )

new_chara = Chara.last
favo_num = 0

contents =["よかったね","喜びコンテンツ2","喜びコンテンツ3","喜びコンテンツ4","おめでとう！私も嬉しいよ"]
contents.length.times do |n|
  MessageContent.create!(
    content: contents[n],
    feeling_id: 1,
    favo: favo_num ,
    chara_id: new_chara.id,
  )
  favo_num  += 25
end

favo_num = 0
contents =["うわ〜ひどいね","怒りコンテンツ2","怒りコンテンツ3","怒りコンテンツ4","殴りに行こうか"]
contents.length.times do |n|
  MessageContent.create!(
    content: contents[n],
    feeling_id: 2,
    favo: favo_num ,
    chara_id: new_chara.id,
  )
  favo_num  += 25
end

favo_num = 0
contents =["それは辛い","哀しみコンテンツ2","哀しみコンテンツ3","哀しみコンテンツ4","辛かったね"]
contents.length.times do |n|
  MessageContent.create!(
    content: contents[n],
    feeling_id: 3,
    favo: favo_num ,
    chara_id: new_chara.id,
  )
  favo_num  += 25
end

favo_num = 0
contents =["いいなぁ","楽しみコンテンツ2","楽しみコンテンツ3","楽しみコンテンツ4","今度一緒にやろうよ"]
contents.length.times do |n|
  MessageContent.create!(
    content: contents[n],
    feeling_id: 4,
    favo: favo_num ,
    chara_id: new_chara.id,
  )
  favo_num  += 25
end
