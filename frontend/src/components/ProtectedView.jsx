import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api";


export default function ProtectedView({ children }) {
    useEffect(() => {
        auth();
    }, []);

    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const navigate = useNavigate();

    const auth = () =>{
        const token = localStorage.getItem("token");
        if (token) {
            try {
            api.defaults.headers.common["Authorization"] = `Token ${token}`; // Backend uses rest_framework_token not jwt
            setIsAuthenticated(true);
            }
            catch (error) {
            console.error('Error validating token:', error);
            }
        }
        else {
            navigate("/login");
        }
    }
    return isAuthenticated ? children : null; // Render children only if authenticated
};