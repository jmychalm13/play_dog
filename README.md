# PlayDog Backend created with Ruby on Rails

PlayDog is a social media app designed with dog lovers in mind. This is the backend built with Ruby on Rails.

## Table of Contents

1. [Installation](#installation)
2. [Usage](#usage)
3. [Frontend Integration](#frontend-integration)

## Installation

### Backend(Ruby on Rails)

1. Clone the backend repository:
   ```bash
   git clone <https://github.com/jmychalm13/play_dog.git>
   ```
2. Navigate into the backend directory:
   ```bash
   cd backend
   ```
3. Install dependencies:
   ```bash
   bundle install
   ```
4. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```
5. Start the Rails server:
   ```bash
   rails server
   ```
6. Seed the database:
   There is some simple Ruby code in the seeds file that will run to seed the database.
   ```bash
   rails db:seed
   ```

## Usage

### Accessing the Application
1. Ensure that both the backend (Ruby on Rails) and frontend (React) servers are running per the installation instructions.

### API Endpoints Documentation
The PlayDog backend provides a RESTful API for interacting with various features of the application. Below you will find an overview of the available endpoints:
- 'http://localhost:3000/users': Endpoint for retrieving and managing all user profiles.
- 'http://localhost:3000/dogs': Endpoint for retrieving and managing all dog profiles.

### Example Requests and Reponses
- Creating a Dog
**Request**
```http
POST HTTP://localhost:3000/dogs
Content-Type: application/json

{
  "name": "Spot",
  "breed": "pittie",
  "age": 2,
  "user_id": 1,
}
```

## Frontend Integration

To use the PlayDog frontend with the backend API, make sure to follow these steps:
1. Clone the frontend repository from 'https://github.com/jmychalm13/play_dog_frontend.git'
2. Follow the setup instructions provided in the frontend repository's README to start the frontend server
3. Ensure that the frontend server is running while using the backend API to interact with PlayDog's features.

## Project Status

This project is still in development and not all features are functioning yet. While efforts are being made to implement all planned features and ensure stability, there may be bugs and incomlete functionality. 

