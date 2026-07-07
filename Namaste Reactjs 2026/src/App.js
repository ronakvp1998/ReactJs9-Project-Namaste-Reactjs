import React from "react";
import ReactDOM from "react-dom/client"; // ✅ Correct for React 18+
import { data } from "./utils/data.js";
import Header from  "./components/Header.js";
import Body from "./components/Body.js";

const AppLayout = () => {
  return (
    <div className="app">
      <Header />
      <Body/>
    </div>
  );
};

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<AppLayout />);
