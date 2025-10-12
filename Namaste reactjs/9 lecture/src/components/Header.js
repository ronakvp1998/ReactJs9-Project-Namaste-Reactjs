import { useState } from "react";
import Logo from "../assets/img/logo.png";
import { Link } from "react-router-dom";

const Header = () => {
  // const title = "Food Villa";
  // const [title, setTitle] = useState("Food Villa");
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  return (
    <div className="header">
      <Title />
      {/* <h1>{title}</h1> */}
      {/* <button onClick={() => setTitle("New Food App")}>Change Title</button> */}
      <div className="nav-items">
        <ul>
          <Link to="/">
            <li>Home </li>
          </Link>
          <Link to="/about">
            <li>About </li>
          </Link>
          <Link to="/contact">
            <li>Contact </li>
          </Link>
          <Link to="/cart">
            <li>Cart </li>
          </Link>
        </ul>
      </div>
      {isLoggedIn ? (
        <button onClick={() => setIsLoggedIn(false)}>Logout</button>
      ) : (
        <button onClick={() => setIsLoggedIn(true)}>Login</button>
      )}
    </div>
  );
};

export const Title = () => (
  <a href="/">
    <img className="logo" alt="logo" src={Logo}></img>
  </a>
);
export default Header;
