import { use, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import Shimmer from "./Shimmer";
import { IMG_URL } from "../utils/constants";

const RestaurantMenu = () => {
  const [resInfo, setResInfo] = useState(null);
  const { resId } = useParams();
  console.log(resId);

  useEffect(() => {
    fetchMenu();
  }, []);

  const fetchMenu = async () => {
    try {
      // const restaurantId = "31489"; // Example restaurant
      const restaurantId = resId;
      const response = await fetch(
        `http://localhost:5000/api/menu/${restaurantId}`
      );
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const json = await response.json();
      setResInfo(json);
    } catch (error) {
      console.error("Error fetching menu:", error);
    }
  };

  const { name, cuisines, costForTwoMessage, cloudinaryImageId } =
    resInfo?.data?.cards?.[2]?.card?.card?.info || {};

  const categories =
    resInfo?.data?.cards?.[4]?.groupedCard?.cardGroupMap?.REGULAR?.cards?.[3]
      ?.card?.card?.categories || [];

  return resInfo === null ? (
    <Shimmer />
  ) : (
    <div className="menu">
      <img
        className="res-logo"
        alt="res-logo"
        src={IMG_URL + cloudinaryImageId}
      />
      <h1>{name}</h1>
      <h3>{cuisines?.join(", ")}</h3>
      <h3>{costForTwoMessage}</h3>
      <h3>Menu</h3>
      <ul>
        {categories.map((categorie) => (
          <li key={categorie?.title}>
            <h4>{categorie?.title}</h4>
            <ul>
              {categorie?.itemCards?.map((item) => (
                <li key={item?.card?.info?.id}>
                  {item?.card?.info?.name} - ₹
                  {item?.card?.info?.price / 100 ||
                    item?.card?.info?.defaultPrice / 100}
                </li>
              ))}
            </ul>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default RestaurantMenu;
