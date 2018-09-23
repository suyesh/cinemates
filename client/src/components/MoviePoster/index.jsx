import React, { Component } from "react";
import Img from "react-image";
import Rating from "../Rating";
import { MovieListMovie } from "./styles";
import Loading from "../Loading";

class MoviePoster extends Component {
  render() {
    const { movie } = this.props;
    return (
      <MovieListMovie
        image={`http://image.tmdb.org/t/p/w300${movie.posterImage}`}
      >
        <Rating averageVote={movie.averageVote} />
        <Img
          src={`http://image.tmdb.org/t/p/w300${movie.posterImage}`}
          loader={
            <Loading
              loading={true}
              inverted={false}
              content="Loading image..."
            />
          }
        />
      </MovieListMovie>
    );
  }
}

export default MoviePoster;
