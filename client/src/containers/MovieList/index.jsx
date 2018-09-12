import React, { Component } from "react";
import { Query } from "react-apollo";
import { connect } from "react-redux";

import { ALL_MOVIES } from "../../queries";
import Movie from "../../components/Movie";
import { MovieListDiv } from "./styles";

class MovieList extends Component {
  renderMovies = allMovies =>
    allMovies.map(movie => <Movie key={movie.id} movie={movie} />);

  render() {
    const { page } = this.props;
    return (
      <MovieListDiv>
        <Query query={ALL_MOVIES} variables={{ page }}>
          {({ loading, error, data }) => {
            if (loading) return <div>Fetching</div>;
            if (error) return <div>Error</div>;
            return this.renderMovies(data.allMovies.list);
          }}
        </Query>
      </MovieListDiv>
    );
  }
}

const mapStateToProps = ({ movieList }) => ({
  page: movieList.page
});

export default connect(mapStateToProps)(MovieList);
