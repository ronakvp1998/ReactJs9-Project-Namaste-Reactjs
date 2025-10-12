import { useRouteError } from "react-router-dom";
import Header from "./Header";
const Error = () => {
  const err = useRouteError();
  console.log(err);
  return (
    <div>
      <Header />
      <h1>Loading</h1>
      <h2>Something went wrong</h2>
      <h2>{err.status + " : " + err.statusText}</h2>
    </div>
  );
};

export default Error;
