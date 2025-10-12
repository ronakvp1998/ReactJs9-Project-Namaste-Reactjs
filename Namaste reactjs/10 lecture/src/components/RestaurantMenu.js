import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import { IMG_CDN_URL } from "../constants";
import Shimmer from "./Shimmer";

const RestaurantMenu = () => {
  // how to read a dynamic URL using useParams hooks
  const { id } = useParams();

  const [restaurant, setRestaurant] = useState(null);

  useEffect(() => {
    getRestaurantInfo();
  }, []);

  async function getRestaurantInfo() {
    const data = await fetch(
      "https://www.swiggy.com/dapi/menu/pl?page-type=REGULAR_MENU&complete-menu=true&lat=19.2667572&lng=72.9695681&restaurantId=" +
        id
    );
    const json = await data.json();
    console.log(json);
    setRestaurant(json);
  }

  if (!restaurant) {
    return <Shimmer />;
  }

  const restaurantInfo = restaurant.data?.cards[2]?.card?.card?.info || {};

  // Extract all menu cards dynamically
  const groupedCards =
    restaurant.data?.cards[4]?.groupedCard?.cardGroupMap?.REGULAR?.cards || [];

  // Flatten and extract item cards from all grouped cards
  const menuItems = groupedCards.flatMap(
    (groupCard) => groupCard.card?.card?.itemCards || []
  );

  return (
    <div className="menu">
      <div>
        <h1>Restaurant id: {id}</h1>
        <h2>{restaurantInfo.name}</h2>
        <img
          className="RestaurantImage"
          src={IMG_CDN_URL + restaurantInfo.cloudinaryImageId}
        />
        <h3>{restaurantInfo.areaName}</h3>
        <h3>{restaurantInfo.city}</h3>
        <h3>{restaurantInfo.costForTwo}</h3>
      </div>
      <div>
        <h1>Menu</h1>
        <ul>
          {menuItems.map((item) => (
            <li key={item.card.info.id}>
              {item.card.info.name} - Price: ₹
              {(item.card.info.price || item.card.info.defaultPrice) / 100}
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};
export default RestaurantMenu;
