import { useEffect,useState } from "react";
import { restaurantDetailsAPI } from "../utils/constants.js";

const useRestaurantMenu = (resId) => {

    const [resInfo,setResInfo] = useState(null);
    useEffect(() => {
        fetchData(resId);
    },[]);

    const fetchData = async(resId) => {
        const data = await fetch(restaurantDetailsAPI.replace("${resId}", resId));
        const json = await data.json();
        console.log(json);
        setResInfo(json);
    }

  return resInfo;
}

export default useRestaurantMenu;