User.destroy_all

u = User.create({
                email: 'renat@aomega.co',
                password: 'mpak888',
                name: 'MpaK',
                uri:  'mpak'
            })
u.confirm

Blog.destroy_all

Blog.create({
                name:        'MpaKus Dominion',
                description: 'обитель',
                owner:       u,
                variant:     :personal
            })
