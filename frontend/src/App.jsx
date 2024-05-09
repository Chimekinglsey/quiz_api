import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Register from "./pages/Register";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import TakeQuiz from "./pages/TakeQuiz";
import Error404 from "./pages/Error404";
import ProtectedView from "./components/ProtectedView";
// import 'bootstrap/dist/css/bootstrap.min.css'


function App() {
  return (
    <>
    <Router>
      <Routes>
        <Route path="/register" element={<Register />}></Route>
        <Route path="/login" element={<Login />}></Route>
        <Route path="/takequiz" element={<ProtectedView><TakeQuiz/> </ProtectedView>}></Route>
        <Route path="/" exact element={
          <ProtectedView>
            <Dashboard/>
          </ProtectedView>
          }>
        </Route>
        <Route path="*" element={<Error404 />}></Route>
      </Routes>
    </Router>
    </>
  )
}

export default App