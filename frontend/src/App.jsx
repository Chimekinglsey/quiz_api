import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Register from "./pages/Register";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import TakeQuiz from "./pages/TakeQuiz";
import Error404 from "./pages/Error404";
import ProtectedView from "./components/ProtectedView";
import 'bootstrap/dist/css/bootstrap.min.css'
import { Modal, Button } from "react-bootstrap";


function App() {
  return (
    <Router>
      <Routes>
        <Route path="/register" element={<Register />} />
        <Route path="/login" element={<Login />} />
        <Route path="/takequiz/:quizId" element={<ProtectedView><TakeQuiz /></ProtectedView>} />
        <Route path="/" element={<ProtectedView><Dashboard /></ProtectedView>} />
        <Route path="*" element={<Error404 />} />
      </Routes>
    </Router>
  );
}

export default App;
