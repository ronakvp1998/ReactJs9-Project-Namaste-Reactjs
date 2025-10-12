import React from "react";
import ReactDOM from "react-dom/client";
import { createElement as ce } from "react";

const Title = () => (
  <h1 id="title" key="h2">
    Namaste React
  </h1>
);

const HeadingComponent = () => {
  return (
    <div>
      {Title()}
      <h2>Namaste react functional component</h2>
      <h2>This is a h2 tag</h2>
    </div>
  );
};

const root = ReactDOM.createRoot(document.getElementById("root"));
// passing a react element inside the root
root.render(<HeadingComponent />);
