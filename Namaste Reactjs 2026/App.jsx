import React from "react";
import ReactDOM from "react-dom/client"; // ✅ Correct for React 18+
import Header from "./components/Header.js";
import {data} from "./data.jsx";
const style = {
  backgroundColor: "#f0f0f0",
}

// const RestaurantCard = ({resName, cusine}) => {
//   return(
//     <div className="res-card" style={style}>
//       <h2>{resName} Coffee</h2>
//       <img className="res-logo" src="https://dineout-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto/DINEOUT_ALL_RESTAURANTS/IMAGES/RESTAURANT_IMAGE_SERVICE/2025/8/8/1be84912-9df2-4c78-ad9d-72a726496d17_image34ef30ed05fb047d692ed8c81ebc5e1e6.JPG"></img>
//       <h3>{cusine}</h3>
//       <h4>4.5</h4>
//       <h4>10min</h4>
//     </div>
//   )
// }

const RestaurantCard = ({resData}) => {
  return(
    <div className="res-card" style={style}>
      <h2>{resData?.name}</h2>
      <img className="res-logo" src={"https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_1600,h_640,c_fill/"+resData?.cloudinaryImageId}></img>
      <h3>{resData?.cuisines?.join(", ")}</h3>
      <h4>{resData?.avgRating}</h4>
      <h4>{resData?.sla?.deliveryTime + " min"}</h4>
    </div>
  )
}

const resObj = data?.data.cards[1].card.card.gridElements.infoWithStyle

const Body = () => {
  return(
    <div>
      <div className="search"></div>
      <div className="res-container">
      {
        resObj.restaurants.map((restaurant) => {
          return <RestaurantCard resData = {restaurant.info} key={restaurant.info.id} />
        })}
      </div>
    </div>
  )
}

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
