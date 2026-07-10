import User from "./User"
import UserClass from "./UserClass.js"

const About = () => {
    return(
        <div>
            <h1>About Us</h1>
            <p>This is a food delivery app built using React.js. It is a clone of Swiggy.</p>
            <User/>
            <UserClass name="Rohan" location="Delhi" contact="0987654321" email="rohan@gmail.com"/>
        </div>
    )
}

export default About