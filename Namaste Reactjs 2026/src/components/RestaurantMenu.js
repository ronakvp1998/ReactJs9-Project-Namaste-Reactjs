import { useEffect } from "react";
import { useState } from "react";
import { IMG_URL,restaurantDetailsAPI } from "../utils/constants.js";
import { useParams } from "react-router-dom";

const RestaurantMenu = () => {
  const [restaurant, setRestaurant] = useState(null);

  const { resId } = useParams();

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const data = await fetch(restaurantDetailsAPI.replace("${resId}", resId));
    const json = await data.json();
    console.log(json);
    setRestaurant(json);
  };

  return restaurant === null ? (
    <h1>Loading...</h1>
  ) : (
    <div className="restaurant-menu">
      {console.log("restaurant " + restaurant)}
      <h1>{restaurant?.name}</h1>
      <h2>Menu</h2>
      <img
        src={IMG_URL + restaurant?.cloudinaryImageId}
        alt={restaurant?.name}
        onError={(e) => {
          // If the Swiggy image fails, load a generic food placeholder
          e.target.src =
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=508&h=320&fit=crop";
        }}
      />
      <ul>
        {restaurant?.menu?.items.map((item) => (
          <li key={item.id}>{item.name + "  =>  " + item.price + " ₹"} </li>
        ))}
      </ul>
    </div>
  );
};

export default RestaurantMenu;
