
Event.destroy_all
Comment.destroy_all

#events
Event.create({title:"Beach Party", location:"Muir Beach", event_date:"12/25/16", event_time:"5:00pm", description:"For Jesus' birthday?" })
Event.create({title:"Forest Party", location:"Muir Woods", event_date:"12/25/16", event_time:"6:00pm", description:"Just 'cause!" })
Event.create({title:"Birthday Party", location:"Sarah's House", event_date:"6/2/16", event_time:"5:pm", description:"For Rene's birthday!" })
Event.create({title:"Now 1999", location:"General Assembly", event_date:"1/1/99", event_time:"2:pm", description:"Release party for the Now 1999! CD" })


#comment
Comment.create({description: "I hate you guys. You're the worst", contribution: "poop"})
Comment.create({description: "Wow this is cool", contribution: "toilet paper"})
Comment.create({description: "bloop bloop", contribution: "5"})
Comment.create({description: "I've never met a carrot I didn't like... EXCEPT FOR THIS ONE", contribution: "this one carrot"})
Comment.create({description: "coolio is my favorite music artist of all time.", contribution: "noonoo (the vacuum from teletubbies)"})
