import React, { Component, Fragment } from "react";
import SecondaryNav from "../../containers/SecondaryNav";
import MovieList from "../../containers/MovieList";

class App extends Component {
  render() {
    return (
      <Fragment>
        <SecondaryNav />
        <MovieList />
      </Fragment>
    );
  }
}

export default App;
