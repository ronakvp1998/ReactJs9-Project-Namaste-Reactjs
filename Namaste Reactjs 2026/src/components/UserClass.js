import React from "react";

class UserClass extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            count : 0,
            count2: 0,
        }   
    }
  render() {
    return (
      <div className="bg-gray-200 p-4 rounded-lg shadow-lg w-[250px]">
        <h1>Count: {this.state.count}</h1>
        <button onClick={() => this.setState({count: this.state.count + 1,count2: this.state.count2 + 1})} >Count increase</button>
        <h2>Name: {this.props.name}</h2>
        <h2>Location: {this.props.location}</h2>
        <h2>Contact: {this.props.contact}</h2>
        <h2>Email: {this.props.email}</h2>
      </div>
    );
  }
}

export default UserClass;
