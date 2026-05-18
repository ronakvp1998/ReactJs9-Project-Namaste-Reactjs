import React from "react";
import { useRouteError } from "react-router-dom";

const Error = () => {
  const err = useRouteError();
  console.log(err);
  return (
    <div style={{ textAlign: "center", marginTop: "100px" }}>
      <h3>
        {err.status} : {err.statusText}
      </h3>
      <p>Oops! The page you're looking for doesn’t exist.</p>
      <a href="/">Go Back Home</a>
    </div>
  );
};

export default Error;
