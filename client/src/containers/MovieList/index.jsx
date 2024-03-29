import React, { Component } from "react";
import { Query } from "react-apollo";
import { connect } from "react-redux";
import { Segment } from "semantic-ui-react";

import { ALL_MOVIES } from "../../queries";
import MoviePoster from "../../components/MoviePoster";
import { MovieListMovies } from "./styles";

class MovieList extends Component {
  renderMovies = allMovies =>
    allMovies.map(movie => <MoviePoster key={movie.id} movie={movie} />);

  render() {
    const { dispatch, ...variables } = this.props;
    return (
      <Segment as={MovieListMovies} attached="bottom">
        <Query query={ALL_MOVIES} variables={{ ...variables }}>
          {({ loading, error, data }) => {
            if (loading) return null;
            if (error) return <div>Error</div>;
            return this.renderMovies(data.allMovies.list);
          }}
        </Query>
      </Segment>
    );
  }
}

const mapStateToProps = ({ movieList }) => ({
  page: movieList.page,
  adult: movieList.adult,
  topRated: movieList.topRated,
  lowRated: movieList.lowRated,
  upcoming: movieList.upcoming,
  nowPlaying: movieList.nowPlaying,
  popular: movieList.popular
});

export default connect(mapStateToProps)(MovieList);
