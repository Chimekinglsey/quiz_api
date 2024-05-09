import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Card, ListGroup, ListGroupItem, Button, Form, Col } from 'react-bootstrap';
import api from '../api';

const Quiz = () => {
  const { quizId } = useParams();
  const navigate = useNavigate();

  const [quizData, setQuizData] = useState(null);
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [userAnswers, setUserAnswers] = useState({});
  const [score, setScore] = useState(0);

  useEffect(() => {
    const fetchQuiz = async () => {
      const response = await api.get(`/api/quizzes/${quizId}/`);
      console.log(response.data)
      setQuizData(response.data);
    };
    fetchQuiz();
  }, [quizId]);

  const handleNextQuestion = () => {
    setCurrentQuestion(currentQuestion + 1);
  };

  const handleAnswerChange = (event) => {
    setUserAnswers({ ...userAnswers, [event.target.name]: event.target.value });
  };

  const handleSubmitQuiz = async () => {
    const answers = Object.values(userAnswers);
    const response = await api.post(`/quizzes/${quizId}/submit/`, { answers });
    const { score, message } = response.data;
    setScore(score);
    alert(message); // TODO: replace with a proper result display component
    navigate('/'); // Redirect to home page after submission
  };

  const renderQuestion = () => {
    if (!quizData) return <p>Loading quiz...</p>;

    const currentQuestionData = quizData.questions[currentQuestion];

    if (!currentQuestionData) return <p>Quiz completed!</p>;

    return (
      <>
        <Card>
          <Card.Header as="h5">{currentQuestionData.text}</Card.Header>
          <ListGroup variant="flush">
            {currentQuestionData.answers.map((answer) => (
              <ListGroupItem key={answer.id}>
                <Form.Check
                  inline
                  type="radio"
                  label={answer.text}
                  name={currentQuestionData.id} // Use question ID as name for answer group
                  value={answer.id}
                  checked={userAnswers[currentQuestionData.id] === answer.id}
                  onChange={handleAnswerChange}
                />
              </ListGroupItem>
            ))}
          </ListGroup>
        </Card>
        <Button variant="primary" disabled={currentQuestion === quizData.questions.length - 1} onClick={handleNextQuestion}>
          Next Question
        </Button>
        {currentQuestion === quizData.questions.length - 1 && (
          <Button variant="success" onClick={handleSubmitQuiz}>
            Submit Quiz
          </Button>
        )}
      </>
    );
  };

  return (
    <div>
      <h1>Quiz: {quizData?.title}</h1>
      {renderQuestion()}
    </div>
  );
};

export default Quiz;
