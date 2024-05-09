import React, { useState, useEffect } from 'react';
import api from '../api';
import { Card, ListGroup, ListGroupItem } from 'react-bootstrap';

const ListQuiz = () => {
  const [quizzes, setQuizzes] = useState([]);

  useEffect(() => {
    fetchQuizzes()
  }, []);
  
  const fetchQuizzes = async () => {
    const response = await api.get('/quizzes/')
    setQuizzes(response.data)
  }

  return (
    <Card>
      <Card.Header as="h5">Available Quizzes</Card.Header>
      <ListGroup variant="flush">
        {quizzes.map((quiz) => (
          <ListGroupItem key={quiz.id} action href={`/quizzes/${quiz.id}/take`}>
            {quiz.title}
          </ListGroupItem>
        ))}
      </ListGroup>
    </Card>
  );
};

export default ListQuiz;
