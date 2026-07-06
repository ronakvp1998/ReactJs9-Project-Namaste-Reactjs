import React from "react";
import ReactDOM from "react-dom/client";

const Heading = () => (
    <h1 className="head" tabIndex="5">
        Namaste React! Heading
    </h1>
)

const elem = (
    <div>
        <Heading/>
        <h1>Namaste React! Element</h1>
    </div>  
)
const num = 1000;

const HeadingComponent = () => (
    <div>
        {num + 200}
        {console.log(num + 200)}
        {elem}
        <Heading/>
        {Heading()}
        <h1>Namaste React Functional Component</h1>
    </div>
)
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<HeadingComponent/>);