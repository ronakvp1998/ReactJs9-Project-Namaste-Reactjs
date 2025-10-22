import { useState } from "react";
import { LOGO_URL } from "../utils/constants";
import { Link } from "react-router-dom"; // ✅ Import Link
const Header = () => {
  let btnName = "Login";
  const [btnNameNew, setBtnName] = useState(btnName);
  return (
    <div className="header">
      <div className="logo-container">
        {/* Always include an alt attribute and self-close the img tag */}
        <Link to="/">
          <img className="logo" src={LOGO_URL} alt="Food Logo" />
        </Link>
      </div>
      <div className="nav-items">
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/about">About Us</Link>
          </li>
          <li>
            <Link to="/contact">Contact Us</Link>
          </li>
          <li>
            <Link to="/cart">Cart</Link>
          </li>
          <button
            className="login"
            onClick={() =>
              btnNameNew === "Login"
                ? setBtnName("Logout")
                : setBtnName("Login")
            }
          >
            {btnNameNew}
          </button>
        </ul>
      </div>
    </div>
  );
};

export default Header;
