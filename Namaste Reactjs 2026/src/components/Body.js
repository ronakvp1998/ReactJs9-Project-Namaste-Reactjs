import {data} from "../utils/data.js";
import RestaurantCard from "./RestaurantCard.js";
import { useState } from "react";
const resObj = data?.data.cards[1].card.card.gridElements.infoWithStyle

const Body =() => {

const [resList, setResList] = useState(resObj);

    return (
        <div className="body">
            <div className="filter-container">
                <div className="filter">
                <button className="filter-btn" 
                onClick={() => {
                    const filteredRestaurants = 
                    resObj.restaurants
                    .filter(r => r.info.avgRating > 4.5);
                    
                    setResList(
                        { restaurants: filteredRestaurants }
                    );
                }}
                >Top Rated Restaurant
                </button>
            </div>
            <div className="filter">
                <button className="filter-btn" 
                onClick={() => {
                    const filteredRestaurants = resObj.restaurants;
                    setResList(
                        { restaurants: filteredRestaurants }
                    );
                }}
                >All Restaurant
                </button>
            </div>
            </div>
            <div className="search">Search</div>
            <div className="res-container">
                {
                    resList.restaurants.map((restaurant) => {
                        return <RestaurantCard resData = {restaurant.info} key={restaurant.info.id} />  
                    })
                }
            </div>

        </div>
    )
}

export default Body;