import React, { Component, Fragment } from "react";
import { Query } from "react-apollo";
import { connect } from "react-redux";
import styled from "styled-components";

import { ALL_MOVIES } from "../../queries";
import Movie from "./Movie";

const MovieListDiv = styled.div`
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(185px, 1fr));
  grid-auto-rows: minmax(300px, auto);
  grid-auto-flow: dense;
  -webkit-transition: width 2s linear 1s;
  transition: width 2s linear 1s;
`;

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
