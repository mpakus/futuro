User.destroy_all

u = User.create({
                email: 'renat@aomega.co',
                password: 'mpak888',
                name: 'MpaK',
                uri:  'mpak'
            })
u.confirm
