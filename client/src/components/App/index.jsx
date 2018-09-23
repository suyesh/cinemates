import React, { Component, Fragment } from "react";
import MovieList from "../../containers/MovieList";
import SecondaryNavBar from "../../containers/SecondaryNavBar";

class App extends Component {
  render() {
    return (
      <Fragment>
        <SecondaryNavBar />
        <MovieList />
      </Fragment>
    );
  }
}

export default App;
