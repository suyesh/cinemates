import { combineReducers } from "redux";
import { MovieListReducer } from "../containers/MovieList/redux";

const rootReducer = combineReducers({
  movieList: MovieListReducer
});

export default rootReducer;
