import {
  CHANGE_PAGE_NUMBER,
  TOGGLE_TOP_RATED,
  TOGGLE_LOW_RATED,
  TOGGLE_UPCOMING,
  TOGGLE_NOW_PLAYING,
  TOGGLE_ADULT,
  TOGGLE_POPULAR
} from "./movieListActions";

const InitialState = {
  page: 1,
  topRated: false,
  lowRated: false,
  upcoming: false,
  nowPlaying: false,
  popular: true,
  adult: false
};

const MovieListReducer = (state = InitialState, action) => {
  switch (action.type) {
    case CHANGE_PAGE_NUMBER:
      return {
        ...state,
        page: action.payload
      };
    case TOGGLE_TOP_RATED:
      return {
        ...InitialState,
        popular: false,
        topRated: !state.topRated
      };
    case TOGGLE_LOW_RATED:
      return {
        ...InitialState,
        popular: false,
        lowRated: !state.lowRated
      };
    case TOGGLE_UPCOMING:
      return {
        ...InitialState,
        popular: false,
        upcoming: !state.upcoming
      };
    case TOGGLE_NOW_PLAYING:
      return {
        ...InitialState,
        popular: false,
        nowPlaying: !state.nowPlaying
      };
    case TOGGLE_ADULT:
      return {
        ...InitialState,
        adult: !state.adult
      };
    case TOGGLE_POPULAR:
      return {
        ...InitialState,
        page: state.page
      };
    default:
      return {
        ...state
      };
  }
};

export { MovieListReducer };
