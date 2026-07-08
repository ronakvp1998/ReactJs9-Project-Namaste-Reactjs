import { useEffect } from "react";
import { useState } from "react";
import { IMG_URL, restaurantDetailsAPI } from "../utils/constants.js";
import { useParams } from "react-router-dom";
import Error from "./Error.js";

const RestaurantMenu = () => {
  const [restaurant, setRestaurant] = useState(null);

  const { resId } = useParams();

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const data = await fetch(restaurantDetailsAPI.replace("${resId}", resId));
      if(data?.status === 200) {
        const json = await data.json();
        setRestaurant(json);
      }else{
        <Error/>
      }
    } catch (error) {
      console.error("Failed to fetch restaurants:", error);
    }
  };

  return restaurant === null ? (
    <Error/>
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
