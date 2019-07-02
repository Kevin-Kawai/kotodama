# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Subject.destroy_all
Resource.destroy_all
Section.destroy_all

subject = Subject.create(name: "React")

resource = subject.resources.create(url: "www.test.com", language: "EN")
subject.resources.create(url: "www.test.com/ja", language: "JP")

resource.sections.create(url: "www.test.com/section/1", title: "Intro")
resource.sections.create(url: "www.test.com/section/2", title: "Next")
resource.sections.create(url: "www.test.com/section/3", title: "Awesome")
