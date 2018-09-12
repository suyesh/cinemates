import React, { Component } from "react";
import Rating from "../Rating";
import MovieLike from "../MovieLike";
import { MovieListMovie } from "./styles";

class Movie extends Component {
  state = {
    toolbarShow: false
  };
  render() {
    const { movie } = this.props;
    return (
      <MovieListMovie
        image={`http://image.tmdb.org/t/p/w300${movie.posterImage}`}
        onMouseEnter={() => this.setState({ toolbarShow: true })}
        onMouseLeave={() => this.setState({ toolbarShow: false })}
        className="animated slideInUp"
      >
        <Rating averageVote={movie.averageVote} />
        <MovieLike show={this.state.toolbarShow} movie={movie} />
        <img
          alt={movie.originalTitle}
          src={`http://image.tmdb.org/t/p/w300${movie.posterImage}`}
        />
      </MovieListMovie>
    );
  }
}

export default Movie;
