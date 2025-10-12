import React from "react";
import ReactDOM from "react-dom/client"; // ✅ Correct for React 18+

// Create nested structure using React.createElement
const parent = React.createElement("div", { id: "parent" }, [
  React.createElement("div", { id: "child1", key: 1 }, [
    React.createElement("h1", { key: "h1a" }, "I'm an h1 tag"),
    React.createElement("h2", { key: "h2a" }, "I'm an h2 tag"),
  ]),
  React.createElement("div", { id: "child2", key: 2 }, [
    React.createElement("h1", { key: "h1b" }, "I'm an h1 tag"),
    React.createElement("h2", { key: "h2b" }, "I'm an h2 tag"),
  ]),
]);

const jsxHeading = (
  <h1 className="head" tabIndex="1">
    Namaste React using JSX
  </h1>
);

const HeadingComponent = () => {
  return (
    <div>
      {title()}
      <HeadingComponent2 />
    </div>
  );
};

const HeadingComponent2 = () => <h1>Namaste REact</h1>;
const title = () => <h1>Namaste REact</h1>;

console.log(jsxHeading);
// Attach React root and render
const root = ReactDOM.createRoot(document.getElementById("root"));
// root.render(parent);
root.render(<HeadingComponent />);
