import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Card, ListGroup, ListGroupItem, Button, Form, Col } from 'react-bootstrap';
import api from '../api';

const Quiz = ({ quizId }) => {
  const navigate = useNavigate();

  const [quizData, setQuizData] = useState(null);
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [userAnswers, setUserAnswers] = useState({});
  const [score, setScore] = useState(0);
  const [nextButtonClicked, setNextButtonClicked] = useState(false);
  const [showModal, setShowModal] = useState(false); // State for modal visibility
  let title;
  let message;

  useEffect(() => {
    const fetchQuiz = async () => {
      if (!quizId) {
        console.error("Missing quizId parameter");
        return;
      }
      const response = await api.get(`/quizzes/${quizId}/take/`);
      setQuizData(response.data);
    };
    fetchQuiz();
  }, [quizId]);

  const handleNextQuestion = () => {
    setCurrentQuestion(currentQuestion + 1);
    setNextButtonClicked(true);
  };

  const handlePreviousQuestion = () => {
    setCurrentQuestion(currentQuestion - 1);
  };

  const handleAnswerChange = (event) => {
    const { name, value } = event.target;
    setUserAnswers(prevAnswers => ({
      ...prevAnswers,
      [name]: value
    }));
  };

  const handleSubmitQuiz = async () => {
    const response = await api.post(`/quizzes/${quizId}/submit/`, { answers: userAnswers });
    const { score } = response.data;
    setScore(score);
    title = score > 50 ? 'Congratulations!' : 'Quiz Results';
    message = response.data.message
    setShowModal(true); // Show modal after submission
  };

  const handleCloseModal = () => {
    setShowModal(false);
    navigate('/'); // Redirect to home page
  };

  const renderQuestion = () => {
    if (!quizData) return <p>Loading quiz...</p>;

    const currentQuestionData = quizData.quiz_data[currentQuestion];

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
      {showModal && (
        <div className="modal"> {/* Modal container */}
          <div className="modal-content"> {/* Modal content */}
            <div className="modal-header">
              <h5 className="modal-title">{title}</h5>
              <button type="button" className="close" onClick={handleCloseModal}>
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div className="modal-body">
              <p>Your score: {score}</p>
              <p>{message}</p>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" onClick={handleCloseModal}>
                Close
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default Quiz