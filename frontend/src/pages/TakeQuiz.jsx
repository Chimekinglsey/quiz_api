import React from 'react';
import Quiz from '../components/Quiz';
import { useParams } from 'react-router-dom';

const TakeQuiz = () => {
  const { quizId } = useParams();

  return <Quiz quizId={quizId} />;
};

export default TakeQuiz;