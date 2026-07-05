import React from "react";
import ReactDOM from "react-dom/client";

const heading = React.createElement("div",{id:"heading",key: "heading"},[
        React.createElement("div",{id: "child1",key: "child1"},[
            React.createElement("h1",{id: "child1.1",key: "child1.1"},"Namaste Reactjs"),
            React.createElement("h1",{id: "child1.2",key: "child1.2"},"Namaste Reactjs")
        ]),
        React.createElement("div",{id: "child2",key: "child2"},[
            React.createElement("h1",{id: "child2.1",key: "child2.1"},"Namaste Reactjs"),
            React.createElement("h1",{id: "child2.2",key: "child2.2"},"Namaste Reactjs")
        ])
    ])

    const root = ReactDOM.createRoot(document.getElementById("root"))
    console.log(heading)
    root.render(heading );