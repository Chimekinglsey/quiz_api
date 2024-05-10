# quiz Manager

This project is a simple web application that allows users to take quizzes.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Python installed (version 3.11 or higher)
- pip installed
- [Optional] Virtual environment set up (recommended for isolating project dependencies)

## Installation

1. Clone the repository:
```
git clone https://github.com/chimekinglsey/quiz_api
cd quiz_api
```

## Configuration

1. Create a `.env` file in the project directory and configure the following environment variables:

```
DB_NAME=your_database_name
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_HOST=your_database_host
DB_PORT=your_database_port
SECRETS=your_secrets_key
DJANGO_SECRETS=your_django_secrets_key
```


## Running the Application

Follow these steps to run the application:

### Backend (Django)

1. Create a virtual environment (optional but recommended):

```
python3 -m venv venv
```

2. Activate the virtual environment:

```
source venv/bin/activate
```

3. Install the required Python packages:

```
pip install -r requirements.txt
```

4. Configure your database:
   - Create a MySQL database named `your_db_name_in_env`.
   - Ensure that the user has permissions to administer the database.

5. Apply migrations to the database:

```
cd quiz_manager
python manage.py makemigrations
python manage.py migrate
```

6. Start the Django development server:

```
python manage.py runserver
```
### Testing with custom database.
To test, you can dump the quiz_api.sql into your database to have created tests and users
  ```bash
  mysql -u username -p database_name < quiz_api.sql
  ```
  replace username with your db_username and database_name with your database name

7. Access the application in your web browser at `http://localhost:8000/`

## Frontend (React) Installation

1. Navigate to the frontend directory:

```
cd frontend
```

2. Install dependencies:

```
npm install
```

### Installation

To run the frontend locally, follow these steps:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/chimekinglsey/hub-assessment-frontend.git
cd contract_manager
```

2. Install the dependencies using npm:

```bash
npm install
```

This will install all the necessary packages specified in the `package.json` file.

### Configuration

Before running the frontend, ensure that the backend server is running and configured correctly. Update the `.env` file in the project directory with the appropriate backend API URL:

```dotenv
REACT_APP_API_URL=http://localhost:8000
```

Replace `http://localhost:8000` with the URL where your backend server is running.

## Usage

To start the development server, run the following command:

3. Start the React development server:

```
npm run dev
```

This will start the development server and open the application in your default web browser. You can also access the application at `http://localhost:5173`.

## Dependencies

The frontend uses the following dependencies:

- **axios**: HTTP client for making API requests.
- **bootstrap**: Frontend framework for styling and layout.
- **jwt-decode**: Library for decoding JWT tokens.
- **react**: JavaScript library for building user interfaces.
- **react-bootstrap**: React components library based on Bootstrap.
- **react-dom**: React package for DOM rendering.
- **react-router-dom**: React routing library for navigation.

## Development Dependencies

In addition to the above dependencies, the frontend uses the following development dependencies:

- **@types/react**: TypeScript type definitions for React.
- **@types/react-dom**: TypeScript type definitions for ReactDOM.
- **@vitejs/plugin-react**: Vite plugin for React support.
- **eslint**: JavaScript linter for code quality.
- **eslint-plugin-react**: ESLint plugin for React-specific linting rules.
- **eslint-plugin-react-hooks**: ESLint plugin for React Hooks linting rules.
- **eslint-plugin-react-refresh**: ESLint plugin for React Refresh linting rules.
- **vite**: Fast build tool for modern web development.



4. Access the application in your web browser at the provided URL (typically `http://localhost:5173/`)

## API Endpoints

- **/register/** - User registration endpoint.
- **/login/** - User login endpoint.
- **/logout/** - User logout endpoint.
- **/** - List and search quizzes (GET).
- **/takequiz/<int:pk>/** - Retrieve quiz details (GET), Update quiz details (PUT), Delete quiz (DELETE).

## Testing

To run tests, execute the following command:

```
python manage.py test
```

Please ensure that you have MySQL installed and configured correctly before running the application. If you encounter any issues or have any questions, feel free to reach out for assistance.## Contributors

- [Chika Chime](https://github.com/chimekinglsey)

