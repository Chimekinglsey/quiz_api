// ListQuiz.jsx
import React, { useState, useEffect } from 'react';
import { Card, ListGroup, ListGroupItem, Alert } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import api from '../api';

const ListQuiz = () => {
  const [quizzes, setQuizzes] = useState([]);

  useEffect(() => {
    fetchQuizzes();
  }, []);

  const fetchQuizzes = async () => {
    const response = await api.get('/quizzes/');
    setQuizzes(response.data);
  };

  if (!quizzes || quizzes.length === 0) {
    return (
      <Alert variant="info" className="mt-3">
        No quizzes available yet!
      </Alert>
    );
  }

  return (
    <Card className="mt-3">
      <Card.Header as="h5" className="bg-primary text-white">Available Quizzes</Card.Header>
      <ListGroup variant="flush">
        {quizzes.map((quiz) => (
          <ListGroup.Item key={quiz.id} action>
            <Link to={`/takequiz/${quiz.id}`} className="list-group-item-primary">
              <div className="d-flex justify-content-between align-items-center">
                <span>{quiz.title}</span>
              </div>
            </Link>
          </ListGroup.Item>
        ))}
      </ListGroup>
    </Card>
  );
};

export default ListQuiz;