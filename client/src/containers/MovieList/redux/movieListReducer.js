import {
  CHANGE_PAGE_NUMBER,
  TOGGLE_TOP_RATED,
  TOGGLE_LOW_RATED,
  TOGGLE_UPCOMING,
  TOGGLE_NOW_PLAYING,
  TOGGLE_ADULT
} from "./movieListActions";

const InitialState = {
  page: 1,
  topRated: false,
  lowRated: false,
  upcoming: false,
  nowPlaying: false,
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
        topRated: !state.topRated
      };
    case TOGGLE_LOW_RATED:
      return {
        ...InitialState,
        lowRated: !state.lowRated
      };
    case TOGGLE_UPCOMING:
      return {
        ...InitialState,
        upcoming: !state.upcoming
      };
    case TOGGLE_NOW_PLAYING:
      return {
        ...InitialState,
        nowPlaying: !state.nowPlaying
      };
    case TOGGLE_ADULT:
      console.log(state.adult);
      return {
        ...InitialState,
        adult: !state.adult
      };
    default:
      return {
        ...state
      };
  }
};

export { MovieListReducer };
