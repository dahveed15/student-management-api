# README

## Prerequisites

### Required Installations
1. Ruby (Recommended version: 3.x)
   - Download from https://www.ruby-lang.org/en/downloads/
   - Or use a version manager like `rbenv` or `rvm`

2. PostgreSQL
   - Download from https://www.postgresql.org/download/
   - Ensure PostgreSQL server is running

3. Bundler (Ruby dependency manager)
   - gem install bundler

### Setup Instructions
1. Clone the Repository

2. Install Dependencies
   - bundle install

3. Database Setup
   1. Create the database
      - rails db:create
   2. Run migrations to set up the schema 
      - rails db:migrate

4. Start the Rails Server
   - rails server or rails s


The API will be available at `http://localhost:3000`

### API Endpoints

#### Students Endpoints

1. List All Students
- **Method:** GET
- **URL:** `http://localhost:3000/students`
- **Response:** JSON array of students

2. Create a New Student
- **Method:** POST
- **URL:** `http://localhost:3000/students`
- **Body:** 
  ```json
  {
    "student": {
      "name": "John Doe",
      "grade": 5
    }
  }
  ```

3. Update a Student
- **Method:** PUT
- **URL:** `http://localhost:3000/students/:id`
- **Body:**
  ```json
  {
    "student": {
      "name": "Updated Name",
      "grade": 6
    }
  }
  ```

4. Delete a Student
- **Method:** DELETE
- **URL:** `http://localhost:3000/students/:id`