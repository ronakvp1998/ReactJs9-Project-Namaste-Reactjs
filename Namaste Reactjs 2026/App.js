const heading = React.createElement("div",{id:"heading"},[
        React.createElement("div",{id: "child1"},[
            React.createElement("h1",{id: "child1.1"},"Namaste Reactjs"),
            React.createElement("h1",{id: "child1.2"},"Namaste Reactjs")
        ]),
        React.createElement("div",{id: "child2"},[
            React.createElement("h1",{id: "child2.1"},"Namaste Reactjs"),
            React.createElement("h1",{id: "child2.2"},"Namaste Reactjs")
        ])
    ])

    const root = ReactDOM.createRoot(document.getElementById("root"))
    console.log(heading)
    root.render(heading );