import RestaurantCard, { withPromotedLabel } from "./RestaurantCard.js";
import { useState, useEffect } from "react";
import Shimmer from "./Shimmer.js";
import { Link } from "react-router-dom";
import useOnlineStatus from "../utils/useOnlineStatus.js";
import UserContext from "../utils/UserContext.js";
import { useContext } from "react";

const Body = () => {
  // hoops needs to be created inside the component function, otherwise it will give an error "Invalid hook call. Hooks can only be called inside of the body of a function component."

  // 1. Keep a copy of the original data so it's never lost
  const [allRestaurants, setAllRestaurants] = useState([]);

  // 2. Keep track of the data currently being displayed (filtered or not)
  const [filteredRestaurants, setFilteredRestaurants] = useState([]);

  // 3. search text
  const [searchText, setSearchText] = useState("");

  // is no dependency array is provided, useEffect will run on every render
  // if an empty dependency array is provided, useEffect will run only once after the initial render
  // if a dependency array with variables is provided, useEffect will run only when those variables change
  useEffect(() => {
    console.log("fetching data");
    fetchData();
  }, []);

  const {loggedInUser,setNameInfo} = useContext(UserContext);

  const [userName, setUserName] = useState("");


  const fetchData = async () => {
    try {
      const data = await fetch("http://localhost:8080/api/v1/restaurants");
      const json = await data.json();
      console.log(json);

      // Set both states with the initial fetched array
      setAllRestaurants(json);
      setFilteredRestaurants(json);
    } catch (error) {
      console.error("Failed to fetch restaurants:", error);
    }
  };

  const onlineStatus = useOnlineStatus();

  if (!onlineStatus) {
    return <h1>You are offline. Please check your internet connection.</h1>;
  }

  const RestaurantCardPromoted = withPromotedLabel(RestaurantCard);

  return filteredRestaurants.length === 0 ? (
    <Shimmer />
  ) : (
    <div className="body">
      <div className="flex p-4 ">
        <div className="px-4">
          <button
            className="bg-gray-100 px-4 py-1 rounded-lg"
            onClick={() => {
              // Filter against the ORIGINAL list
              const topRated = allRestaurants.filter((r) => r.avgRating > 4.5);

              // Update the DISPLAYED list (keep it as an array)
              setFilteredRestaurants(topRated);
            }}
          >
            Top Rated Restaurant
          </button>
        </div>
        <div className="px-4">
          <button
            className="bg-gray-100 px-4 py-1 rounded-lg"
            onClick={() => {
              // Reset the DISPLAYED list back to the original list
              setFilteredRestaurants(allRestaurants);
            }}
          >
            All Restaurant
          </button>
        </div>
        <div>
            <label>User Name: </label>
            <input className="border-4" type="text" value={loggedInUser} onChange={(e) => setNameInfo(e.target.value)} />
        </div>
      </div>
      <div className="flex justify-center px-4">
        <input
          className="border-4 w-[1000px]"
          type="text"
          placeholder=" Search for restaurants"
          value={searchText}
          onChange={(e) => {
            setSearchText(e.target.value.toLowerCase());
          }}
        />
        <button
          className="px-4 py-2 bg-green-100 rounded-lg ml-4"
          onClick={(e) => {
            const filtered = allRestaurants.filter((restaurant) => {
              return restaurant.name.toLowerCase().includes(searchText);
            });
            setFilteredRestaurants(
              filtered.length > 0 ? filtered : allRestaurants,
            );
          }}
        >
          Search
        </button>
      </div>

      <div className="flex flex-wrap justify-center p-4 ">
        {/* Map over the filtered state, not a local variable */}
        {filteredRestaurants.map((restaurant) => {
          return (
            <Link key={restaurant.id} to={`/restaurant/${restaurant.id}`}>
              {restaurant.promoted ? (
                <RestaurantCardPromoted resData={restaurant} />
              ) : (
                <RestaurantCard resData={restaurant} />
              )}
            </Link>
          );
        })}
      </div>
    </div>
  );
};

export default Body;
