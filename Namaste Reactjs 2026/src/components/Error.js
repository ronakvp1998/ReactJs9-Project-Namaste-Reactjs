import Header from "./Header"
import {useRouteError} from "react-router-dom"
const Error = () => {
    const error = useRouteError();
    return (
        <div>
            <h1>Oops! Something went wrong.</h1>
            <p>This is a food delivery app built using React.js. It is a clone of Swiggy.</p>
            <p>{error.status + " : " + error.statusText}</p>
        </div>
    )

}

export default Error