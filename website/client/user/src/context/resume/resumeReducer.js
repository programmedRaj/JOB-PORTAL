import {
  FETCH_RESUME,
  RESUME_ERROR,
  SET_LOADING,
  SET_CURRENT,
  CLEAR_CURRENT,
  ADD_EDU,
  ADD_JOBS,
  ADD_PROJECTS,
  ADD_WORKEX,
  ADD_SKILLS,
  ADD_TRAININGS,
  RESUME_OCR,
} from "./types";

export default (state, action) => {
  switch (action.type) {
    case FETCH_RESUME:
      return {
        ...state,
        resume: action.payload,
      };
    case RESUME_OCR:
      return {
        ...state,
        scanData: action.payload,
      };

    case ADD_EDU:
    case ADD_JOBS:
    case ADD_PROJECTS:
    case ADD_SKILLS:
    case ADD_TRAININGS:
    case ADD_WORKEX:
      return {
        ...state,
        error: null,
      };

    case RESUME_ERROR:
      return {
        ...state,
        error: action.payload,
      };
    case SET_LOADING:
      return {
        ...state,
        loading: action.payload,
      };
    case SET_CURRENT:
      return {
        ...state,
        current: action.payload,
      };
    case CLEAR_CURRENT:
      return {
        ...state,
        current: null,
      };
    default:
      return state;
  }
};
