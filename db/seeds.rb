# frozen_string_literal: true
User.destroy_all
u = User.create(email: 'user@futuro-blog.com',
                password: 'password',
                name: 'User',
                uri:  'user')
u.confirm

Blog.destroy_all
blog = Blog.create(name:        'Home Page',
                   description: 'personal page',
                   owner:       u,
                   variant:     :personal)

Post.destroy_all
100.times do
  blog.posts.create!(
    title: Faker::Lorem.sentence(5),
    content: Faker::Lorem.sentence(300),
    author: u
  )
end
