import { LOGO_URL } from "../utils/constants";
import { useState } from "react";
const Header = () => {

  // let btnName = "Login";

  const [btnName,setBtnName] = useState("Login");
  return (
    <div className="header">
      <div className="logo-container">
        {/* Always include an alt attribute and self-close the img tag */}
        <img className="logo" src={LOGO_URL} alt="Food Logo" />
      </div>
      <div className="nav-items">
        <ul>
          <li>Home</li>
          <li>About Us</li>
          <li>Contact Us</li>
          <li>Cart</li>
          <button className="login-btn"
          onClick= {() => {
            console.log("Login button clicked");
            setBtnName(btnName === "Login" ? "Logout" : "Login");
          }}>{btnName}</button>
        </ul>
      </div>
    </div>
  );
};

export default Header;
