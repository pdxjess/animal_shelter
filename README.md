# _Animal Shelter API_

#### _Week 6 Independent Project for Ruby at Epicodus_

#### By _**Jessica Doss**_

## Description

_A an application that has animals for adoption at shelters. This is intended to demonstrate an understanding of building an API in Ruby and Rails._

## Setup/Installation Requirements

* _Clone repository._
* _Enter project root directory and type "bundle install" to install all necessary gems._
* _Type "rake db:create" to create the databases._
* _Type "rake db:seed" to seed the products and reviews_
* _Sign into Postman to test API calls_

## Endpoints

| Behavior | Route Input | Output |
| ------------- |:-------------:| -----:|
| GET animals | localhost:3000/animals | Returns list of all animals |
| GET animals ID | localhost:3000/animals/{id} | Returns the animal record with the given id |
| GET animals random | localhost:3000/animals/random | Returns the animal record with the given id |
| GET animals search | localhost:3000/animals/search | String required for term to search for |
| POST animals | localhost:3000/animals | Create a new animal record |
| Update animals | localhost:3000/animals/{id} | Allows shelter to make updates |
| DELETE animal | localhost:3000/animals/{id} | Deletes an animal record |


## Known Bugs

_No known bugs_

## Support and contact details

_Please contact us if you have any issues at: doss.jessicam@gmail.com_

## Technologies Used

* Ruby
* PostgreSQL
* RubyGems
* Atom
* GitHub
* Rails

## Acknowledgements
_Thank you to my teachers and partners this week. I wouldn't be where I am without you all._

### License
_This software is licensed under MIT license._

Copyright (c) 2019 **_Jessica Doss_**
