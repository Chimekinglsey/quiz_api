import React from "react";
import axios from "axios";


const token = localStorage.getItem("token");
// An API agent that will be reused for all calls to the backend (if switch to jwt is necessary, our access and refresh tokens will be applied to this same api agent)
const api = axios.create({
    baseURL: "http://127.0.0.1:8000",
    headers: {
        "Content-Type": "application/json",
        Authorization: token ? `Token ${token}` : "",
    },
});

export default api