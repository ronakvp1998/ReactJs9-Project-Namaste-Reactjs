import { useEffect,useState } from "react";

const useOnlineStatus = () => {

    // check if online using online event listener
    const [onlineStatus,setOnlineStatus] = useState(true);
    useEffect(() => {
        window.addEventListener("online", () => {
            setOnlineStatus(true);
        });
        window.addEventListener("offline", () => {
            setOnlineStatus(false);
        });
    }, []);

    return onlineStatus;
}

export default useOnlineStatus;