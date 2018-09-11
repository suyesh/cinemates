import React, { Component, Fragment } from "react";
import { Query } from "react-apollo";
import { ALL_MOVIES } from "../../queries";
import Movie from "./Movie";
import "./MovieList.css";

class MovieList extends Component {
  state = {
    page: 1,
    topRated: false,
    lowRated: false,
    upcoming: false,
    nowPlaying: false,
    adult: false
  };

  renderMovies = allMovies =>
    allMovies.map(movie => <Movie key={movie.id} movie={movie} />);

  render() {
    return (
      <div className="movie-list">
        <Query query={ALL_MOVIES} variables={{ ...this.state }}>
          {({ loading, error, data }) => {
            if (loading) return <div>Fetching</div>;
            if (error) return <div>Error</div>;
            return this.renderMovies(data.allMovies.list);
          }}
        </Query>
      </div>
    );
  }
}

export default MovieList;
