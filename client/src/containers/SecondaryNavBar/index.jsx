import React from "react";
import { connect } from "react-redux";
import { Menu, Segment, Container, Input } from "semantic-ui-react";

import {
  toggleTopRated,
  toggleLowRated,
  toggleUpcoming,
  toggleNowPlaying,
  togglePopular,
  adult
} from "../MovieList/redux/movieListActions";

const SecondaryNavBar = ({
  popular,
  topRated,
  lowRated,
  upcoming,
  nowPlaying,
  toggleTopRated,
  toggleLowRated,
  toggleUpcoming,
  toggleNowPlaying,
  togglePopular,
  toggleAdult,
  adult
}) => (
  <Segment inverted fixed="top">
    <Container fixed="top">
      <Menu inverted secondary fixed="top" className="menu-top-fixed">
        <Menu.Item name="popular" active={popular} onClick={togglePopular}>
          Popular
        </Menu.Item>
        <Menu.Item name="topRated" active={topRated} onClick={toggleTopRated}>
          Top Rated
        </Menu.Item>
        <Menu.Item name="upcoming" active={upcoming} onClick={toggleUpcoming}>
          Upcoming
        </Menu.Item>
        <Menu.Item
          name="nowPlaying"
          active={nowPlaying}
          onClick={toggleNowPlaying}
        >
          Now Playing
        </Menu.Item>
        <Menu.Item name="lowRated" active={lowRated} onClick={toggleLowRated}>
          Low Rated
        </Menu.Item>
        <Menu.Item name="lowRated" active={adult} onClick={toggleAdult}>
          Adult
        </Menu.Item>
        <Menu.Menu position="right">
          <Menu.Item>
            <Input icon="search" placeholder="Search..." />
          </Menu.Item>
          <Menu.Item name="discover">Lists</Menu.Item>
          <Menu.Item name="movies">Network</Menu.Item>
        </Menu.Menu>
      </Menu>
    </Container>
  </Segment>
);

const mapStateToProps = ({ movieList }) => ({
  topRated: movieList.topRated,
  lowRated: movieList.lowRated,
  upcoming: movieList.upcoming,
  nowPlaying: movieList.nowPlaying,
  popular: movieList.popular,
  adult: movieList.adult
});

const actions = {
  toggleTopRated,
  toggleLowRated,
  toggleUpcoming,
  toggleNowPlaying,
  togglePopular,
  toggleAdult: adult
};

export default connect(
  mapStateToProps,
  actions
)(SecondaryNavBar);
