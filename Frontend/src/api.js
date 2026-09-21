import axios from "axios";
import router from "./router"

export const getStudentExam = async (studentId) => {
    try {
        const response = await axios.get(
            "http://localhost:8080/exam/" + studentId 
        );
        console.log(response.data);
    } catch (error) {
        console.error(error);
    }
}

export const postFeedback = async (exam_id, q_number, general_feedback, specific_feedback) => {
    try {
        const response = await axios.post(
            "http://localhost:8080/feedback/", {
                exam_id: exam_id,
                q_number: q_number,
                general_feedback: general_feedback,
                specific_feedback: specific_feedback,
        });
        console.log(response.data);
    } catch (error) {
        console.error(error);
    }
}

export const login = async (username, password) => {
    try {
        const response = await axios.post(
            "http://localhost:8080/login", {
                username: username,
                password: password,
            }
        );
        console.log(response.data);
        router.push('feedback');
    } catch (error) {
        console.error(error);
    }
}
