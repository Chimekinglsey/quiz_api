import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Card, ListGroup, ListGroupItem, Button, Form, Col } from 'react-bootstrap';
import api from '../api';
import ResultModal from './ResultModal';

const Quiz = ({quizId}) => {
  const navigate = useNavigate();
  const [quizData, setQuizData] = useState(null);
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [userAnswers, setUserAnswers] = useState({});
  const [score, setScore] = useState(0);
  const [nextButtonClicked, setNextButtonClicked] = useState(false); // State to track if next button has been clicked
  const [showResultModal, setShowResultModal] = useState(false);

  useEffect(() => {
    const fetchQuiz = async () => {
      if (!quizId) { // Check if quizId is undefined
        console.error("Missing quizId parameter");
        return; // Exit the function early
      }
      const response = await api.get(`/quizzes/${quizId}/take/`);
      setQuizData(response.data);
    };
    fetchQuiz();
  }, [quizId]);

  const handleNextQuestion = () => {
    setCurrentQuestion(currentQuestion + 1);
    setNextButtonClicked(true); // Update state to indicate next button has been clicked
  };

  const handlePreviousQuestion = () => {
    setCurrentQuestion(currentQuestion - 1);
    // No need to update nextButtonClicked here, as previous button should only be enabled after next button is clicked
  };

  
  const handleAnswerChange = (event) => {
    console.log('Answer changed');
    console.log('Event target:', event.target);
    console.log('User answers after update:', userAnswers);
    const { name, value } = event.target;
    setUserAnswers(prevAnswers => ({
      ...prevAnswers,
      [name]: value
    }));
    console.log('User answers before update:', userAnswers);
  };

  const handleSubmitQuiz = async () => {
    const response = await api.post(`/quizzes/${quizId}/submit/`, {'answers': userAnswers}); // Our backend expects a key `answers` with answers as k.v pairs
    const { score, message } = response.data;
    setScore(score);
    const title = score > 50 ? 'Congratulations!' : 'Quiz Results';
    setShowResultModal(true);

  return (
    <ResultModal
      title={title} // Pass the title based on score
      message={message}
      score={score}
      showModal={showResultModal}
      onClose={() => {
        setShowResultModal(false),
        navigate('/') // Redirect to home page
      }}
    />
  );
  };
  

  const renderQuestion = () => {
    if (!quizData) return <p>Loading quiz...</p>;

    const currentQuestionData = quizData.quiz_data[currentQuestion];

    if (!currentQuestionData) return <p>Quiz completed!</p>;
    console.log(quizData.quiz_data);

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
                  name={currentQuestionData.id}
                  value={answer.id}
                  checked={userAnswers[`question${currentQuestion}`] === answer.id}
                  onChange={handleAnswerChange}
                />
              </ListGroupItem>
            ))}
          </ListGroup>
        </Card>
        <Button variant="primary" disabled={currentQuestion === quizData.quiz_data.length - 1} onClick={handleNextQuestion}>
          Next
        </Button>
        <Button variant="secondary" disabled={!nextButtonClicked || currentQuestion === 0} onClick={handlePreviousQuestion}>
          Prev
        </Button>
        {currentQuestion === quizData.quiz_data.length - 1 && (
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