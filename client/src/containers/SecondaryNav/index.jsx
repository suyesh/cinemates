import React from "react";
import { Menu, Input } from "semantic-ui-react";
import { connect } from "react-redux";
import {
  togglePopular,
  toggleTopRated,
  toggleLowRated,
  toggleUpcoming,
  toggleNowPlaying,
  toggleAdult
} from "../MovieList/redux";

const SecondaryNav = ({
  topRated,
  upcoming,
  nowPlaying,
  lowRated,
  popular,
  // adult,
  // toggleAdult,
  toggleLowRated,
  toggleNowPlaying,
  togglePopular,
  toggleTopRated,
  toggleUpcoming
}) => (
  <Menu inverted attached="top" secondary>
    <Menu.Item name="Popular" active={popular} onClick={togglePopular} />
    <Menu.Item name="Top rated" active={topRated} onClick={toggleTopRated} />
    <Menu.Item name="Upcoming" active={upcoming} onClick={toggleUpcoming} />
    <Menu.Item
      name="Now playing"
      active={nowPlaying}
      onClick={toggleNowPlaying}
    />
    <Menu.Item name="Low rated" active={lowRated} onClick={toggleLowRated} />
    {/* <Menu.Item name="Adult" active={adult} onClick={toggleAdult} /> */}
    <Menu.Menu position="right">
      <Menu.Item>
        <Input icon="search" placeholder="Search..." />
      </Menu.Item>
    </Menu.Menu>
  </Menu>
);

const mapStateToProps = ({ movieList }) => ({
  page: movieList.page,
  adult: movieList.adult,
  topRated: movieList.topRated,
  lowRated: movieList.lowRated,
  upcoming: movieList.upcoming,
  nowPlaying: movieList.nowPlaying,
  popular: movieList.popular
});

const actions = {
  toggleAdult,
  toggleTopRated,
  toggleLowRated,
  toggleUpcoming,
  toggleNowPlaying,
  togglePopular
};

export default connect(
  mapStateToProps,
  actions
)(SecondaryNav);
