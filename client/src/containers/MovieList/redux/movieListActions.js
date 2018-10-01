export const CHANGE_PAGE_NUMBER = "CHANGE_PAGE_NUMBER";
export const TOGGLE_TOP_RATED = "TOGGLE_TOP_RATED";
export const TOGGLE_LOW_RATED = "TOGGLE_LOW_RATED";
export const TOGGLE_UPCOMING = "TOGGLE_UPCOMING";
export const TOGGLE_NOW_PLAYING = "TOGGLE_NOW_PLAYING";
export const TOGGLE_ADULT = "TOGGLE_ADULT";
export const TOGGLE_POPULAR = "TOGGLE_POPUlAR";

export const changePageNumber = pageNumber => ({
  type: CHANGE_PAGE_NUMBER,
  payload: pageNumber
});

export const toggleTopRated = () => ({
  type: TOGGLE_TOP_RATED
});

export const toggleLowRated = () => ({
  type: TOGGLE_LOW_RATED
});

export const toggleUpcoming = () => ({
  type: TOGGLE_UPCOMING
});

export const toggleNowPlaying = () => ({
  type: TOGGLE_NOW_PLAYING
});

export const toggleAdult = () => ({
  type: TOGGLE_ADULT
});

export const togglePopular = () => ({
  type: TOGGLE_POPULAR
});
