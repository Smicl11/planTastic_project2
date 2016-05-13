# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.destroy_all

#events
Event.create({title:"Beach Party", location:"Muir Beach", event_date:"12/25/16", event_time:"5:00pm", description:"For Jesus' birthday?" })
Event.create({title:"Forest Party", location:"Muir Woods", event_date:"12/25/16", event_time:"6:00pm", description:"Just 'cause!" })
Event.create({title:"Birthday Party", location:"Sarah's House", event_date:"6/2/16", event_time:"5:pm", description:"For Rene's birthday!" })
Event.create({title:"Now 1999", location:"General Assembly", event_date:"1/1/99", event_time:"2:pm", description:"Release party for the Now 1999! CD" })
