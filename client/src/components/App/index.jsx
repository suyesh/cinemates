import React, { Component } from "react";
import { Segment } from "semantic-ui-react";
import MovieList from "../../containers/MovieList";
import SecondaryNavBar from "../../containers/SecondaryNavBar";

class App extends Component {
  render() {
    return (
      <Segment inverted>
        <SecondaryNavBar />
        <MovieList />
      </Segment>
    );
  }
}

export default App;
