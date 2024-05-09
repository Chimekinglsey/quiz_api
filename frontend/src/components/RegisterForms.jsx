import { useState } from "react";
import api from "../api";
import { useNavigate } from "react-router-dom";
import "../styles/Form.css"
import LoadingIndicator from "./LoadingIndicator";

function RegisterForm() {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [password2, setPassword2] = useState("");
    const [email, setEmail] = useState("");
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();


    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        if (password !== password2) {
            alert("Passwords do not match");
            setLoading(false);
            return;
        }

        try {
            const res = await api.post('/register/', {
                username: username,
                password: password,
                email: email,
                first_name: firstName,
                last_name: lastName,
              })
            navigate("/login")
        } catch (error) {
            alert(error)
        } finally {
            setLoading(false)
        }
    };

    return (
        <form onSubmit={handleSubmit} className="form-container">
            <h1>Sign Up</h1>
            <input
                className="form-input"
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                placeholder="Username"
            />

            <input
                className="form-input"
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="Email"
            />

            <input
                className="form-input"
                type="text"
                value={firstName}
                onChange={(e) => setFirstName(e.target.value)}
                placeholder="First Name"
            />
            
            <input
                className="form-input"
                type="text"
                value={lastName}
                onChange={(e) => setLastName(e.target.value)}
                placeholder="Last Name"
            />
            
            <input
                className="form-input"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Password"
            />
            <input
                className="form-input"
                type="password"
                value={password2}
                onChange={(e) => setPassword2(e.target.value)}
                placeholder="Confirm Password"
            />

            {loading && <LoadingIndicator />}
            <button className="form-button" type="submit">
                Submit
            </button>
        </form>
    );
}

export default RegisterForm