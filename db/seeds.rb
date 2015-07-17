User.destroy_all

u = User.create({
                email: 'renat@aomega.co',
                password: 'mpak888',
                name: 'MpaK',
                uri:  'mpak'
            })
u.confirm

Blog.destroy_all

blog = Blog.create({
                name:        'MpaKus Dominion',
                description: 'обитель',
                owner:       u,
                variant:     :personal
            })

Post.destroy_all

100.times do
  blog.posts.create!(title: Faker::Lorem.sentence(5), content: Faker::Lorem.sentence(300), author: u)
end