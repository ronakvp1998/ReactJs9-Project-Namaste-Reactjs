// import { useEffect } from "react";
import { useState,useContext } from "react";
import { IMG_URL, restaurantDetailsAPI } from "../utils/constants.js";
import { useParams} from "react-router-dom";
import Error from "./Error.js";
import useRestaurantMenu from "../utils/useRestaurantMenu.js";
import RestaurantCategory from "./RestaurantCategory.js";
import UserContext from "../utils/UserContext.js";

const RestaurantMenu = () => {
  // const [restaurant, setRestaurant] = useState(null);

  const { resId } = useParams();

  const data = useContext(UserContext);

  // custom Hook
  const restaurant = useRestaurantMenu(resId);

  // useEffect(() => {
  //   fetchData();
  // }, []);

  // const fetchData = async () => {
  //   try {
  //     const data = await fetch(restaurantDetailsAPI.replace("${resId}", resId));
  //     if(data?.status === 200) {
  //       const json = await data.json();
  //       setRestaurant(json);
  //     }else{
  //       <Error/>
  //     }
  //   } catch (error) {
  //     console.error("Failed to fetch restaurants:", error);
  //   }
  // };

  const resMenuCategory = ["Recommended","Newly Added","Most Popular","Top Rated"];
  const [showIndex, setShowIndex] = useState(null);
  return restaurant === null ? (
    <Error />
  ) : (
    <div className="p-4 m-4 flex flex-wrap justify-center">
      {console.log("restaurant " + restaurant)}
      <div className="p-2 m-2">
        <h1 className="p-2 m-2 font-bold text-2xl">{restaurant?.name}</h1>
        <img
          className="w-[400px] h-[400px] rounded-lg"
          src={IMG_URL + restaurant?.cloudinaryImageId}
          alt={restaurant?.name}
          onError={(e) => {
            // If the Swiggy image fails, load a generic food placeholder
            e.target.src =
              "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=508&h=320&fit=crop";
          }}
        />
        <h2 className="p-2 m-2 font-bold text-xl">Menu</h2>
          {resMenuCategory.map((category,index) => {
            // controlled component
            return (
            <RestaurantCategory category={category} 
            items={restaurant?.menu?.items} key={index} showItems={index === showIndex ? true : false} setShowIndex={() => setShowIndex(index)}/>
          );
          })}
          {/* {restaurant?.menu?.items.map((item) => (
            <li key={item.id}>{item.name + "  =>  " + item.price + " ₹"} </li>
          ))} */}

          <span>{data.loggedInUser}</span>
      </div>
    </div>
  );
};

export default RestaurantMenu;
