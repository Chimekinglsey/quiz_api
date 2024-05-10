import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Card, ListGroup, ListGroupItem, Button, Form, Modal } from 'react-bootstrap';
import api from '../api';


const Quiz = ({ quizId }) => {
  const navigate = useNavigate();

  const [quizData, setQuizData] = useState(null);
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [userAnswers, setUserAnswers] = useState({});
  const [score, setScore] = useState(0);
  const [title, setTitle] = useState('');
  const [message, setMessage] = useState('')
  const [remainingAttempts, setRemainingAttempts] = useState(null);
  const [nextButtonClicked, setNextButtonClicked] = useState(false);
  const [showModal, setShowModal] = useState(false); // State for modal visibility
  const [quesionData, setQuestionData] = useState() // TODO: set quiz title and difficulty for each quiz

  useEffect(() => {
    const fetchQuiz = async () => {
      if (!quizId) {
        console.error("Missing quizId parameter");
        return;
      }
      try {
        const response = await api.get(`/quizzes/${quizId}/take/`);
        setQuizData(response.data);
      } catch (error) {
        if (error.response && error.response.status === 403) {
          setTitle("Error");
          setMessage('You can no longer take this quiz again. Maximum quiz attempt reached.')
          setShowModal(true);
        } else {
          console.error("Error fetching quiz:", error);
        }
      }
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
    try {
      const response = await api.post(`/quizzes/${quizId}/submit/`, { answers: userAnswers });
      const { score } = response.data;
      setScore(score);
      if (score > 50) setTitle('Congratulations!')
      else setTitle('Nice Try!')
      setRemainingAttempts(response.data.remaining_attempts)
      setShowModal(true); // Show modal after submission
    }
    catch (error) {
      if (error.response && error.response.status === 403) {
        setTitle("Error");
        setMessage('You can no longer take this quiz again. Maximum quiz attempt reached.')
        setShowModal(true);
      } else {
        console.error("Error fetching quiz:", error);
      }
    }
  };

  const handleCloseModal = () => {
    setShowModal(false);
    navigate('/'); // Redirect to home page on close
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
                  defaultChecked={userAnswers[`question${currentQuestion}`] === answer.id}
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
      {quizData && ( // Check if quizData is available
          <span className='spanRow'>
            <h3>Quiz: {quizData.quiz_title} </h3>
            <h5>Difficulty: {quizData.difficulty}</h5>
          </span>
        )}
      {renderQuestion()}
      <Modal show={showModal} onHide={handleCloseModal}>
        <Modal.Header closeButton>
          <Modal.Title>{title}</Modal.Title>
        </Modal.Header>
        <Modal.Body>
        {message.length > 0 ? ( // show error only if test attempts is exhausted
          <p>{message}</p>
        ) : (
          <>
            <p>Your score: {score}</p>
            <p>Remaining Attempts: {remainingAttempts}</p>
          </>
        )}
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleCloseModal}>
            Close
          </Button>
        </Modal.Footer>
      </Modal>
    </div>
  );
};

export default Quiz;
