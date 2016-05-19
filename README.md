#PlanTastic app
**by The PlanTastics**

### An open source event planning app, where users can publicize upcoming events.

<!-- ![alt tag](https://raw.githubusercontent.com/username/projectname/branch/path/to/img.png) -->

### Technologies
Ruby on Rails
Bootstrap
Google Places API
PostgresSQL
SASS

### Additional Gems
gem 'simple_form'
gem "friendly_id"
gem 'rspec-rails', '~> 3.0'

<!-- ![alt tag](https://raw.githubusercontent.com/username/projectname/branch/path/to/img.png) -->

#### User Story
- User starts on splash page with jumbotron, user attention brought to login/signup
- If user is logged in the button becomes a create event button
- Navbar allows quick access to creating events, exploring posted events or profile
- Mid page has highlights on app features
- Bottom of Splash page contains info on creators
- Profile has a picture of user, user info and events attending
- From the profile page, user can create events, delete or edit profile
- Graceful fail on all validations, to guide user.

<!-- ![alt tag](https://raw.githubusercontent.com/username/projectname/branch/path/to/img.png) -->

#### Relationship Model
- Model user **has_many** events, comments
- Model attendance **belongs_to** event, user
- Model comment **belongs_to** event, user
- Model event **has_many** users, comments, attendance

<!-- ![alt tag](https://raw.githubusercontent.com/username/projectname/branch/path/to/img.png) -->
